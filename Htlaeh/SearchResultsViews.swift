//
//  ResultsView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/18/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this struct to show the results of a search
 */
struct SearchResultsViews : ViewsStruct {
   
   // MARK: Properties
   /// The controller that will hold all the views
   let controller: Search
   /// The property for all the views
   var views: [UIView: (delay: Double, alpha: CGFloat)] = [:]
   /// The property for the scroller
   lazy var scroller: UIScrollView = self.createScroller()
   
   // MARK: Initializers
   init<T: Controller>(controller: T) {
      
      self.controller = controller as! Search
      
   }
   
   func createScroller() -> UIScrollView {
      
      // Create the scrollers frame and the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      let scroll: UIScrollView = UIScrollView(frame: frame)
      
      // Set the scroller's content height
      scroll.contentSize = CGSize(width: self.controller.width, height: self.controller.height)
      // Add the scroll view to the controller and return it
      self.controller.view.insertSubview(scroll, belowSubview: self.controller.header)
      
      return scroll
      
   }
   
   mutating func layoutViews() {
      
      // Add the scroller to the view
      self.controller.view.addSubview(self.scroller)
      
      // Get the fab and add it to the array
      let fab: Button = self.createFAB()
      self.views[fab] = (delay: 0.125, alpha: 1.0)
      
      // Get the stats view and add it to the array
      self.statsSetup()
      
      // Get the line and label views and add them to the array and add them to the scroller
      let all: (Line, UILabel) = self.createAllLine()
      self.views[all.0] = (delay: 0.075, alpha: 1.0)
      self.scroller.addSubview(all.0)
      self.views[all.1] = (delay: 0.075, alpha: 0.54)
      self.scroller.addSubview(all.1)
      
   }
   
   mutating func statsSetup() {
      // Create the stats view and add it to the scroller
      let stats: StatsView = self.createStatsView()
      self.scroller.addSubview(stats)
      // Get the content for the stats view
      let content: [UILabel] = stats.content
      
      // Set the delay for all the top views and alpha
      for top in stats.topViews {
         self.views[top] = content.contains(top) ? (delay: 0.025, alpha: 0.87) : (delay: 0.025, alpha: 0.38)
      }
      
      // Set the delay and alpha for all the bottom views
      for bottom in stats.bottomViews {
         self.views[bottom] = content.contains(bottom) ? (delay: 0.05, alpha: 0.87) : (delay: 0.05, alpha: 0.38)
         
      }
      
   }
   
   /**
      This function creates the FAB
   */
   func createFAB() -> Button {
      
      // Create the frame for the button and the button
      let frame: Rect = Rect(x: self.controller.width - 72, y: self.controller.height - 72, width: 56, height: 56)
      let button: Button = Button(frame: frame, type: .FAB)
      
      // Add the icon to the button and set the buttons background color
      button.backgroundColor = Color().blue
      button.add(image: Images.Content().filter, color: Color().white)
      
      // Set the action and the alpha for the button
      button.action = { self.controller.filter() }
      button.alpha = 0.0
      
      // Add the button as a subview and return it 
      self.controller.view.addSubview(button)
      return button
      
   }
   
   /**
      This function creates the stats view
   */
   func createStatsView() -> StatsView {
      // Create the frame for the stats view and create the view
      let frame: Rect = Rect(x: 0, y: 1, w: self.controller.width, h: 144)
      
      let data: StatsViewData = RealmQuery().statsFor(exercise: self.controller.header.searchBar!.text!)
      let statsView: StatsView = StatsView(frame: frame, data: data)
      // Add the view to the controller and return the stats view
      return statsView
      
      
   }
   
   /**
      This function creates the line and label
   */
   private func createAllLine() -> (Line, UILabel) {
      // Create the frame for the line and create the line
      let lineFrame: Rect = Rect(x: self.controller.width / 3, y: 189, w: self.controller.width / 3, h: 2)
      let line: Line = Line(frame: lineFrame, alpha: 1.0)
      // Set the lines background color and add it to the controller
      line.backgroundColor = Color().blue
      
      // Create the label and it's frame
      let labelFrame: Rect = Rect(x: self.controller.width / 2 - 100, y: lineFrame.origin.y + 16, w: 200, h: 28)
      let label: UILabel = UILabel(frame: labelFrame, properties: Label(color: Color().black, alpha: 0.54, align: .Center, font: Fonts.Regular().twenty))
      // Set the labels text and add it to the controller
      label.text = "All Sets"
      
      // Set the line and labels alpha
      line.alpha = 0.0
      label.alpha = 0.0
      
      // Return the line and the label
      return (line, label)
      
   }
   
   /**
      This function creates the result table
   */
   
   
}