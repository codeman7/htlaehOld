//
//  BoldHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/25/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This enum is used to determine the button layouts for the header
 */
enum HeaderButtonLayout {
   
   case oneLeftNoneRight, oneLeftOneRight, oneLeftTwoRight, oneLeftFlatRight
   
}

/*enum HeaderType {
   case NewWorkout(NewWorkoutHeader)
}*/

/**
 This is the class that holds the default header
 */
class BoldHeader: UIView {
   // MARK: Properties
   /// Scroll type
   // Defaults to false
   var elevated: Bool = false
   /// The variable for the title of the header
   lazy var title: UILabel = {
      return self.createTitle()
   }()
   /// The variable for the search bar if the header contains it
   var searchBar: SearchBar? = nil
   /// Variable for the bottom line
   lazy var bottomLine: Line = self.createBottomLine()
   
   // MARK: Initalizer
   /**
      Default initalizer
      - parameter frame: The frame that the header will have
      - parameter options: All the settins for the content of the header
   */
   init(frame: CGRect, options: HeaderType) {
      
      super.init(frame: frame)
      self.backgroundColor = .white
      self.addContent(options)
      
      
      
   }
   
   /**
      Required by Apple NEVER USE
   */
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function creates a header for the home controller
      - parameter content: All the content for the header
   */
   private func addContent<A: Head>(content: A) {
      
      self.addTitle(content.title)
      self.addButton(content.leftIcon, action: content.leftButtonAction!, xPosition: 24)
      guard let rightIcon = content.rightIcon else {
         return
      }
      guard let rightAction = content.rightButtonAction else {
         return
      }
      self.addButton(rightIcon, action: rightAction, xPosition: Int(self.frame.width - 48))
      
   }
   /**
      This function is used to add the title to the header
      - parameter text: The text property for the title
   */
   private func addTitle(text: String) {
      
      // Set the text for the label
      title.text = text
      // Add the label to the header
      self.addSubview(title)
      
   }
   
   private func createTitle() -> UILabel {
      
      // Set the frame for the title
      let frame: CGRect = CGRect(x: 72, y: 20, width: 180, height: 48)
      // Set up all the configurations for the label
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: Fonts.Bold.thirtySix, alignment: .Left, color: .black)
      // Create the label
      let title: UILabel = UILabel(config: labelConfig)
      // Set the alpha for the label
      title.alpha = 0.87
      // Return the title
      return title
      
   }
   
   func addDate() {
      // Get the date for the current day
      let date: Date = Date()
      // Set the date to a string
      let stringDate = "\(date.monthAsString()) \(date.day), \(date.year)"
      // Set the frame for the label
      let frame: CGRect = CGRect(x: 72, y: 72, width: self.frame.width - 72, height: 21)
      // Create the configuration for the label
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: Fonts.Regular.sixteen, alignment: .Left
         , color: .black)
      // Create the label
      let label: UILabel = UILabel(config: labelConfig)
      // Set the labels text
      label.text = stringDate
      // Set the labels alpha
      label.alpha = 0.54
      // Add the label
      self.addSubview(label)
      
   }
   
   func update(title: String) {
      
      UIView.animateWithDuration(0.15, animations: {
         self.title.alpha = 0.0
         }, completion: { Bool in
            self.title.text = title
            UIView.animateWithDuration( 0.15, animations: {
               self.title.alpha = 0.87
            })
            
      })
      
   }
   
   /**
      This function is used to add all the buttons to the view
      - parameter icon: The icon that the button will have
      - parameter action: The action that the button will have
      - parameter xPosition: The 'x' position that the button will be in the view
   */
   func addButton(icon: UIImage, action: ()->(), xPosition: Int) {
      
      // Set the frame for the button
      let frame: CGRect = CGRect(x: xPosition, y: 27, width: 40, height: 40)
      // Create the button
      let button: Button = Button(frame: frame, type: .flat)
      // Add the icon to the button
      button.add(icon, color: .black)
      // Set the action for the button
      button.action = action
      // Set the buttons icons alpha
      button.icon?.alpha = 0.87
      // Set background color for button
      button.backgroundColor = .white
      // Add the button to the header
      self.addSubview(button)
      
   }
   
   func addSearchBar(controller: Search) {
      
      // Hide the title
      self.title.alpha = 0.0
      // Create the frame for the search bar and create the search bar
      let frame: Rect = Rect(x: 72, y: 22, w: self.frame.w - 72, h: 48)
      self.searchBar = SearchBar(frame: frame, controller: controller)
      // Add the search bar to the view
      self.addSubview(self.searchBar!)
      
      self.searchBar?.clearAction = { controller.clearedSearch() }
      
      self.addBottomLine()
      
   }
   
   func removeRightIcon() {
      
      if let icon: Button = self.subviews.filter({ $0.frame.origin.x == self.frame.w - 48 }).first as? Button {
         icon.removeFromSuperview()
      }
      
   }
   
   private func createBottomLine() -> Line {
      
      // Set the frame for the line, create the line and return it
      let frame: Rect = Rect(x: 0, y: self.frame.h - 1, w: self.frame.w, h: 1)
      return Line(frame: frame, alpha: 0.14)
      
   }
   
   private func addBottomLine() {
      
      // Add the line to the view
      self.addSubview(self.bottomLine)
      
   }
   
}
