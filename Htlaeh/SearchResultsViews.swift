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
   //lazy var scroller: UIScrollView = self.createScroller()
   /// The property for the workouts
   let exercise: String
   
   // MARK: Initializers
   init<T : Controller>(controller: T) {
      self.controller = controller as! Search
      self.exercise = ""
   }
   
   init(controller: Search, exercise: String) {
      self.exercise = exercise
      self.controller = controller
   }
   
   /*func createScroller() -> UIScrollView {
      
      // Create the scrollers frame and the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      let scroll: UIScrollView = UIScrollView(frame: frame)
      
      // Set the scroller's content height
      scroll.contentSize = CGSize(width: self.controller.width, height: self.controller.height)
      // Add the scroll view to the controller and return it
      self.controller.view.insertSubview(scroll, belowSubview: self.controller.header)
      
      return scroll
      
   }*/
   
   mutating func layoutViews() {
      
      // Add the scroller to the view
      self.createAndAddScroller(self.controller.header)
      
      // Get the fab and add it to the array
      let fab: Button = self.createFAB()
      self.views[fab] = (delay: 0.125, alpha: 1.0)
      
      // Get the stats view and add it to the array
      self.statsSetup()
      
      // Get the line and label views and add them to the array and add them to the scroller
      let all: (Line, UILabel) = self.createAllLine()
      self.views[all.0] = (delay: 0.075, alpha: 1.0)
      self.views[all.1] = (delay: 0.075, alpha: 0.54)
      
   }
   
   mutating func showEmpty(s: String) {
      
      // Get the big label
      let bigLabel: UILabel = self.createBigLabel()
      self.views[bigLabel] = (delay: 0.025, alpha: HomeLabel.bigLabel.alpha)
      
      // Get the message
      let message: UILabel = self.createEmptyMessage(s)
      self.views[message] = (delay: 0.05, alpha: HomeLabel.message.alpha)
      
      // Layout the views
      self.show()
   }
   
   mutating func statsSetup() {
      // Create the stats view and add it to the scroller
      let stats: StatsView = self.createStatsView()
      //self.scroller.addSubview(stats)
      self.controller.view.addSubview(stats)
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
      button.backgroundColor = .blue
      button.add(image: Images.Content().filter, color: .white)
      
      // Set the action and the alpha for the button
      button.action = { self.controller.filter() }
      button.alpha = 0.0
      
      // Add the button as a subview and return it 
      self.controller.view.addSubview(button)
      return button
      
   }
   
   /**
     This function creates the big label for empty results
   */
   func createBigLabel() -> UILabel {
      
      // Set the label's frame
      let frame: Rect = Rect(x: self.controller.width / 2 - 100, y: 196, w: 200, h: 48)
      
      // Create the label and set it's text proeprty
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.bigLabel)
      label.text = "Sorry"
      
      // Set the labels alpha and add it as a subview
      label.alpha = 0.0
      self.controller.view.addSubview(label)
      
      // Return the label
      return label
      
   }
   
   
   /**
    This function creates the message for emtpy results
   */
   func createEmptyMessage(s: String) -> UILabel {
      
      // Create the labels properties and a variable to hold it's text
      let properties: HomeLabel = HomeLabel.message
      let text: String = "We could not find any workouts with the name \"\(s)\"."
      
      // Calculate the label's height and set it's frame
      let height: CGFloat = text.heightWithConstrainedWidth(240, font: properties.font)
      let frame: Rect = Rect(x: (self.controller.width - 240) / 2, y: 260, w: 240, h: height)
      
      // Create the label and set it's alpha
      let label: UILabel = UILabel(frame: frame, properties: properties)
      label.alpha = 0.0

      // Set the label's text and make it so that it can be multiple lines
      label.text = text
      label.multipleLines()
      
      // Add the label to the controller and return it
      self.controller.view.addSubview(label)
      return label
      
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
      line.backgroundColor = .blue
      
      // Create the label and it's frame
      let labelFrame: Rect = Rect(x: self.controller.width / 2 - 100, y: lineFrame.origin.y + 16, w: 200, h: 28)
      let label: UILabel = UILabel(frame: labelFrame, properties: Label(color: .black, alpha: 0.54, align: .Center, font: Fonts.Regular.twenty))
      // Set the labels text and add it to the controller
      label.text = "All Sets"
      
      // Set the line and labels alpha
      line.alpha = 0.0
      label.alpha = 0.0
      
      // Return the line and the label
      return (line, label)
      
   }
   
   /**
      This function creates the result scroller
   */
   private func createAndAddScroller(header: BoldHeader) {
      
      // Create the frame and the scroller
      let frame: Rect = Rect(x: 0, y: 259, width: self.controller.width, height: self.controller.height - 259)
      let scroller: Scroller = Scroller(frame: frame, exercise: self.exercise, header: header)
      
      self.controller.view.addSubview(scroller)
      
   }
   
}