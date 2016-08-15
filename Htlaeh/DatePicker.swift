//
//  DatePicker.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/15/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used to create a date picker for a user to pick the date of the workout that they are creating
 */
class DatePicker : Dialog {
   // MARK: Properties
   /// The current month being shown
   private var month: Int
   /// The current year being shown
   private var year: Int
   /// The action for the right button
   var rightButtonAction: () -> () = { fatalError("Right button aciton must be set") }
   /// The action for the left button
   var leftButtonAction: () -> () = { fatalError("Left button action must be set") }
   // MARK: Initializers
   /**
      Default initializer
      - parameter frame: The frame that the Picker will take
      - parameter month: The month that will first be show
      - parameter year: The year that will first be show
   */
   init(frame: CGRect, promptFrame: CGRect, month: Int, year: Int) {
      
      // Set the month property
      self.month = month
      // Set the year property
      self.year = year
      // Call the super initializer
      super.init(frame: frame, promptFrame: promptFrame)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   override func showView() {
      
      self.addSubview(backgroundGrey)
      self.addSubview(prompt)
      self.backgroundGrey.show(0.26)
      UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
         self.prompt.frame = self.promptFrame
         }, completion: { Bool in
            self.layoutTopView()
            self.layoutBottomView()
      })
      
      
   }
   /**
      This function calls the corresponding functions and lays out the top view
   */
   private func layoutTopView() {
      // Set the frame for the top view
      let frame: Rect = Rect(x: 0, y: 0, w: self.prompt.frame.w, h: 99)
      // Create the UIView that will hold all the contents of the top view
      let view: UIView = UIView(frame: frame)
      // Set the background color for the view
      view.backgroundColor = Color().yellow
      // Add the view to self
      self.prompt.addSubview(view)
      // Add the year to the view
      self.addYearTo(view: view)
      // Add the date to the view
      self.addDateTo(view: view)
      
   }
   
   /**
      This function calls the corresponding functions and lays out the bottom half of the view
   */
   private func layoutBottomView() {
      
      // Add the header to the bottom
      self.addHeader()
      // Add the arrows to the view
      self.addArrows()
      // Add the day labels
      self.addDayLabels()
      // Add the days
      self.addDays()
      // Add bottom buttons
      self.addBottomButtons()
      
   }
   
   /**
      This function adds the top year to the top view
   */
   private func addYearTo(view view: UIView) {
      // Set the frame for the view
      let yearFrame: Rect = Rect(x: 16, y: 16, w: self.prompt.frame.w - 24, h: 19)
      // Create the year label
      let yearLabel: UILabel = UILabel(frame: yearFrame, font: Fonts.Medium().fourteen, align: .Left, color: Color().black)
      // Set the year labels text
      yearLabel.text = "2016"
      // Set the year labels alpha
      yearLabel.alpha = 0.38
      // Add the year label to the view
      self.prompt.addSubview(yearLabel)
      
   }
   
   /**
      This function adds the top date to the top view
   */
   private func addDateTo(view view: UIView) {
      
      // Set the frame for the view
      let frame: Rect = Rect(x: 16, y: 47, w: self.prompt.frame.w - 24, h: 36)
      // Create the date label
      let dateLabel: UILabel = UILabel(frame: frame, font: Fonts.Medium().twentyEight, align: .Left, color: Color().black)
      // Set the alpha for the label
      dateLabel.alpha = 0.76
      // Set the text for the label
      dateLabel.text = "Mon, Aug 15"
      // Add the label to the view
      view.addSubview(dateLabel)
      
   }
   
   /**
      This function adds the header that says month and year to the picker
   */
   private func addHeader() {
      // Set the frame for the header
      let frame: Rect = Rect(x: self.prompt.frame.w / 2 - 60, y: 113, w: 120, h: 21)
      // Create the header label
      let header: UILabel = UILabel(frame: frame, font: Fonts.Regular().sixteen, align: .Center, color: Color().black)
      // Set the text for the header
      header.text = "August 2017"
      // Set the alpha for the header
      header.alpha = 0.87
      // Add the header to the view
      self.prompt.addSubview(header)
      
   }
   
   /**
      This function adds the arrow keys to the bottom view for left and right month navigation
   */
   private func addArrows() {
      // Set up the frame for the left view
      let leftFrame: Rect = Rect(x: 4, y: 103, w: 40, h: 40)
      // Create the left button
      let leftButton: Button = Button(frame: leftFrame, type: .Flat)
      // Add the icon to the left button
      leftButton.add(image: Images.Navigation().chevronBack, alpha: 0.54)
      // Set the action for the button
      leftButton.action = { print("Add action to \(leftButton)") }
      // Add the button to the view
      self.prompt.addSubview(leftButton)
      
      
      // Set up the frame for the right view
      let rightFrame: Rect = Rect(x: self.prompt.frame.w - 44, y: 103, w: 40, h: 40)
      // Create the right button
      let rightButton: Button = Button(frame: rightFrame, type: .Flat)
      // Add the icon to the button
      rightButton.add(image: Images.Navigation().chevronForward, alpha: 0.54)
      // Set the action for the button
      rightButton.action = { print("Add action to the \(rightButton)") }
      // Add the button to the view
      self.prompt.addSubview(rightButton)
   }
   
   /**
      This function adds the labels for the days 'm', 't', 'w', etc.
   */
   private func addDayLabels() {
      
      // Create the array for the labels text
      let labelText: [Character] = ["S", "M", "T", "W", "T", "F", "S"]
      // Create the size for the labels
      let labelSize: CGSize = CGSize(width: 40, height: 21)
      // Iterate 7 times to add all the labels
      for a in 0..<7 {
         // Create the frame for the label
         let frame: Rect = Rect(x: CGFloat(a * 40), y: 155, w: labelSize.width, h: labelSize.height)
         // Create the label
         let label: UILabel = UILabel(frame: frame, font: Fonts.Medium().fourteen, align: .Center, color: Color().black)
         // Set the alpha for the label
         label.alpha = 0.38
         // Set the text for the label
         label.text = "\(labelText[a])"
         // Add the label to the view
         self.prompt.addSubview(label)
         
      }
      
   }
   
   /**
      This function adds all the day buttons
   */
   private func addDays() {
      
      // Get the number of days in the month
      let days: Int = 31
      // Get the first day of the month
      let firstDay: Int = 1
      // Iterate over the 6 rows 7 times 42 total and add the buttons
      var dayCount: Int = 0
      for a in 0..<42 {
         // What to add buttons until at first day
         if a >= firstDay {
            // Make sure aren't adding extra days
            guard dayCount < days else { return }
            // Update day count
            dayCount += 1
            // Get the origin for the button
            let origin: CGPoint = CGPoint(x: CGFloat(a % 7 * 40) + 4, y: CGFloat(a / 7 * 40) + 188)
            self.addButtonAt(origin: origin, withLabel: "\(dayCount)")
         }
      }
      
   }
   
   /**
      This function adds all the day buttons to the view
      - parameter origin: The point at which the button will be
      - parameter withLabel: The text property for the button
   */
   private func addButtonAt(origin origin: CGPoint, withLabel text: String) {
      
      // Create the frame for the button
      let frame: Rect = Rect(origin: origin, size: CGSize(width: 40, height: 40))
      // Create the button
      let button: Button = Button(frame: frame, type: .Flat)
      // Round the button
      button.layer.cornerRadius = 20
      // Add the title to the button
      button.add(title: text, color: Color().black)
      // Set the alpha for the title
      button.label?.alpha = 0.87
      // Set the font for the button
      button.label?.font = Fonts.Medium().twelve
      // Add the button to the view
      self.prompt.addSubview(button)
      
   }
   
   /**
      This function adds the two bottom buttons
   */
   private func addBottomButtons() {
      // Get the right bottom button
      let rightButton: Button = self.createRightBottomButton()
      // Add the button to the view
      self.prompt.addSubview(rightButton)
      // Create the left button button
      let leftButton: Button = self.createLeftBottomButton(rightButtonWidth: rightButton.frame.w)
      // Add the button to the view
      self.prompt.addSubview(leftButton)
      
   }
   
   /**
      This function adds the right button - most commonly 'add workout'
   */
   private func createRightBottomButton() -> Button {
      
      let width: CGFloat = "ADD WORKOUT".widthWithConstrainedHeight(22, font: Fonts.Medium().fourteen)
      // Set the frame for the button
      let frame: Rect = Rect(x: self.prompt.frame.w - (width + 24), y: self.prompt.frame.h - 56, w: width, h: 40)
      // Create the button
      let button: Button = Button(frame: frame, type: .Flat)
      // Add the title to the button
      button.add(title: "ADD WORKOUT", color: Color().blue)
      // Set the action for the button
      button.action = self.rightButtonAction
      // Return the button
      return button
      
   }
   
   /**
      This function adds the left button - most commonly the cancel button
   */
   private func createLeftBottomButton(rightButtonWidth width: CGFloat) -> Button {
      
      let buttonWidth: CGFloat = "CANCEL".widthWithConstrainedHeight(22, font: Fonts.Medium().fourteen)
      // Set the frame for the button
      let frame: Rect = Rect(x: self.prompt.frame.w - (width + buttonWidth + 48), y: self.prompt.frame.h - 56, w: buttonWidth, h: 40)
      // Create the button
      let button: Button = Button(frame: frame, type: .Flat)
      // Add the title to the button
      button.add(title: "CANCEL", color: Color().red)
      // Set the action for the button
      button.action = self.leftButtonAction
      // Return the button
      return button
      
   }
}






