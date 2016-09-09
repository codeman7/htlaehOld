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
   private var month: Int = Date().month
   /// The current year being shown
   private var year: Int = Date().year
   /// The current day selected
   private var day: Int = Date().day
   /// The date that is currently selected and will be used
   var date: String {
      get {
         return DatabaseDate(year: self.year, month: self.month, day: self.day).toDBFormat()
      }
   }
   //lazy var date: String = { return DatabaseDate(year: self.year, month: self.month, day: self.day).toDBFormat() }()
   /// The property for the year label
   private lazy var yearLabel: UILabel = { self.createYearLabel() }()
   /// The property for the top label
   private lazy var topLabel: UILabel = { self.createTopLabel() }()
   /// The property for the month header on the bottom view
   private lazy var monthHeader: UILabel = { self.createMonthHeader() }()
   /// The property for the day buttons view
   private lazy var dayButtonView: UIView = { self.createDayView() }()
   /// The property for all the day buttons
   private var dayButtons: [Button] = []
   /// The days in the current month that have a workout in them already scheduled
   lazy private var days: [Int] = { return RealmQuery().workoutDaysIn(self.month, year: self.year) }()
   /// The action for the right button
   var rightButtonAction: () -> () = { fatalError("Right button aciton must be set") }
   /// The action for the left button
   var leftButtonAction: () -> () = { fatalError("Left button action must be set") }
   /// Determine if the views have been layed out or not
   var layedOut: Bool = false
   
   // MARK: Initializers
   /**
      Default initializer
      - parameter frame: The frame that the Picker will take
      - parameter month: The month that will first be show
      - parameter year: The year that will first be show
   */
   override init(frame: CGRect, promptFrame: CGRect) {

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
      UIView.animateWithDuration(0.3, animations: {
         self.prompt.frame = self.promptFrame
         }, completion: { Bool in
            // Make sure the views haven't been layed out or return if they have
            guard self.layedOut == false else { return }
            // Add the layouts
            self.layoutTopView()
            self.layoutBottomView()
            // Set layout to true
            self.layedOut = true
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
      view.backgroundColor = .yellow
      // Add the view to self
      self.prompt.addSubview(view)
      // Add the year to the view
      view.addSubview(self.yearLabel)
      // Add the date to the view
      view.addSubview(self.topLabel)
      
   }
   
   /**
      This function calls the corresponding functions and lays out the bottom half of the view
   */
   private func layoutBottomView() {
      
      // Add the header to the bottom
      self.prompt.addSubview(self.monthHeader)
      // Add the arrows to the view
      self.addArrows()
      // Add the day labels
      self.addDayLabels()
      // Add the day view as a subview of prompt
      self.prompt.addSubview(self.dayButtonView)
      // Add the days
      self.addDays()
      // Add bottom buttons
      self.addBottomButtons()
      
   }
   
   /**
      This function adds the arrow keys to the bottom view for left and right month navigation
   */
   private func addArrows() {
      // Set up the frame for the left view
      let leftFrame: Rect = Rect(x: 4, y: 103, w: 40, h: 40)
      // Create the left button
      let leftButton: Button = Button(frame: leftFrame, type: .flat)//, action: { self.newMonth(change: -1) })
      // Add the icon to the left button
      leftButton.add(Images.Navigation().chevronBack, alpha: 0.54)
      leftButton.action = { self.newMonth(-1) }
      // Add the button to the view
      self.prompt.addSubview(leftButton)
      
      // Set up the frame for the right view
      let rightFrame: Rect = Rect(x: self.prompt.frame.w - 44, y: 103, w: 40, h: 40)
      // Create the right button
      let rightButton: Button = Button(frame: rightFrame, type: .flat)//, action: { self.newMonth(change: 1) })
      // Add the icon to the button
      rightButton.add(Images.Navigation().chevronForward, alpha: 0.54)
      rightButton.action = { self.newMonth(1) }
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
         let label: UILabel = UILabel(frame: frame, font: Fonts.Medium.fourteen, align: .Center, color: .black)
         // Set the alpha for the label
         label.alpha = 0.38
         // Set the text for the label
         label.text = "\(labelText[a])"
         // Add the label to the view
         self.prompt.addSubview(label)
      }
      
   }
   
   /**
      This function creates a UIView for the month that is being shown
      - parameter month: The month that will be shown
      - parameter year: The year that will be shown
      - parameter change: The difference between month created and month that was present
   */
   private func createDaysViewFor(month: Int, inYear: Int, change: Int) {
      // Create the frame for the view that will hold all the new buttons
      let placeholderViewFrame: Rect = Rect(x: CGFloat(change) * self.dayButtonView.frame.w, y: 0, w: self.dayButtonView.frame.w, h: self.dayButtonView.frame.h)
      // Create the view that will hold all the buttons
      let placeholderView: UIView? = UIView(frame: placeholderViewFrame)
      // Add that view as a subview
      self.dayButtonView.addSubview(placeholderView!)
      // Get the number of days in the month
      let days: Int = Date().daysIn(month, year: year)
      // Get the first day of the month
      let firstDay: Int = Date().getFirstDayOf("\(month)", year: "\(year)")
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
            let origin: CGPoint = CGPoint(x: CGFloat(a % 7 * 40) + 4, y: CGFloat(a / 7 * 40))
            self.addButtonAt(origin, withLabel: dayCount, toView: placeholderView!)
         }
      }
      
   }
   
   /**
      This function adds all the day buttons
   */
   private func addDays() {
      // Create the frame for the view that will hold all the new buttons
      let placeholderViewFrame: Rect = Rect(x: 0, y: 0, w: self.dayButtonView.frame.w, h: self.dayButtonView.frame.h)
      // Create teh view that will holda all the buttons
      let placeholderView: UIView? = UIView(frame: placeholderViewFrame)
      // Add that view to the day button view
      self.dayButtonView.addSubview(placeholderView!)
      // Get the number of days in the month
      let days: Int = Date().daysIn(self.month, year: self.year)
      // Get the first day of the month
      let firstDay: Int = Date().getFirstDayOf("\(self.month)", year: "\(self.year)")
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
            let origin: CGPoint = CGPoint(x: CGFloat(a % 7 * 40) + 4, y: CGFloat(a / 7 * 40))
            self.addButtonAt(origin, withLabel: dayCount, toView: placeholderView!)
         }
      }
      
   }
   
   /**
      This function adds all the day buttons to the view
      - parameter origin: The point at which the button will be
      - parameter withLabel: The text property for the button
   */
   private func addButtonAt(origin: CGPoint, withLabel number: Int, toView view: UIView?) {
      
      // Create the frame for the button
      let frame: Rect = Rect(origin: origin, size: CGSize(width: 40, height: 40))
      // Create the button
      let button: Button = Button(frame: frame, type: .flat)
      // Round the button
      button.layer.cornerRadius = 20
      // Add the title to the button
      (self.days.contains(number)) ? button.set(title: "\(number)", color: .red) : button.set(title: "\(number)", color: .black)
      // Set the alpha for the title
      button.label.alpha = 0.87
      // Set the font for the button
      button.label.font = Fonts.Medium.twelve
      // Check if the day is the current day
      self.checkForDay(button)
      // Set the action for the buttons
      button.action = { self.picked(Int(button.label.text!)!) }
      // Add the buttons to the day buttons array
      self.dayButtons += [button]
      // Add the button to the view
      view!.addSubview(button)
      
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
      
      let width: CGFloat = "ADD WORKOUT".widthWithConstrainedHeight(22, font: Fonts.Medium.fourteen)
      // Set the frame for the button
      let frame: Rect = Rect(x: self.prompt.frame.w - (width + 24), y: self.prompt.frame.h - 56, w: width, h: 40)
      // Create the button
      let button: Button = Button(frame: frame, type: .flat)
      // Add the title to the button
      button.set(title: "ADD WORKOUT", color: .blue)
      // Set the action for the button
      button.action = self.rightButtonAction
      // Return the button
      return button
      
   }
   
   /**
      This function adds the left button - most commonly the cancel button
      - parameter rightButtonWidth: The width of the button on the right
   */
   private func createLeftBottomButton(rightButtonWidth width: CGFloat) -> Button {
      
      let buttonWidth: CGFloat = "CANCEL".widthWithConstrainedHeight(22, font: Fonts.Medium.fourteen)
      // Set the frame for the button
      let frame: Rect = Rect(x: self.prompt.frame.w - (width + buttonWidth + 48), y: self.prompt.frame.h - 56, w: buttonWidth, h: 40)
      // Create the button
      let button: Button = Button(frame: frame, type: .flat)
      // Add the title to the button
      button.set(title: "CANCEL", color: .red)
      // Set the action for the button
      button.action = self.leftButtonAction
      // Return the button
      return button
      
   }
   
   private func checkForDay(button: Button) {
      
      guard self.month == Date().month else {
         return
      }
      // Check to see button's label is the same value as current day
      if Int(button.label.text!)! == day {
         // Set the color of the button to blue
         button.backgroundColor = .blue
         // Set the text color for the button to be white
         button.label.textColor = .white
      }
      
   }
   
}

// MARK: Create all the lazy views
extension DatePicker {
   
   /**
    This function creates the year view
    */
   private func createYearLabel() -> UILabel {
      
      // Set the frame for the view
      let yearFrame: Rect = Rect(x: 16, y: 16, w: self.prompt.frame.w - 24, h: 19)
      // Create the year label
      let yearLabel: UILabel = UILabel(frame: yearFrame, font: Fonts.Medium.fourteen, align: .Left, color: .black)
      // Set the year labels text
      yearLabel.text = "\(self.year)"
      // Set the year labels alpha
      yearLabel.alpha = 0.38
      // Return the year label
      return yearLabel
      
   }
   
   /**
    This function creates the top label that contains day of week, month, day number
    */
   private func createTopLabel() -> UILabel {
      
      // Set the frame for the view
      let frame: Rect = Rect(x: 16, y: 47, w: self.prompt.frame.w - 24, h: 36)
      // Create the date label
      let dateLabel: UILabel = UILabel(frame: frame, font: Fonts.Medium.twentyEight, align: .Left, color: .black)
      // Set the alpha for the label
      dateLabel.alpha = 0.76
      // Set the text for the label
      dateLabel.text = "\(Date().dayOfWeek(self.day, inMonth: self.month, year: self.year)[0...2]), \(Date().nameOf(self.month)[0...2]) \(day)"
      // Return the label
      return dateLabel
      
   }
   
   /**
    This function adds the header that says month and year to the picker
    */
   private func createMonthHeader() -> UILabel {
      
      // Set the frame for the header
      let frame: Rect = Rect(x: self.prompt.frame.w / 2 - 60, y: 113, w: 120, h: 21)
      // Create the header label
      let header: UILabel = UILabel(frame: frame, font: Fonts.Regular.sixteen, align: .Center, color: .black)
      // Set the text for the header
      header.text = "\(Date().nameOf(self.month)) \(self.year)"
      // Set the alpha for the header
      header.alpha = 0.87
      // Return the header
      return header
      
   }
   
   /**
    This function creates the view that holds all the buttons
    */
   private func createDayView() -> UIView {
      
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: 188, w: self.prompt.frame.w, h: 280)
      // Create the view
      let view: UIView = UIView(frame: frame)
      // Make the view mask to bounds
      view.layer.masksToBounds = true
      // Return the view
      return view
      
   }
   
}

// MARK: Extension for user interaction
extension DatePicker {
   
   private func newMonth(change: Int) {
      // Create a new month with the change
      let tempMonth = self.month + change
      // Check to see if year needs to be updated and month reset or just a regular month update
      switch tempMonth {
      case 13:
         self.month = 1
         self.year = self.year + 1
      case 0:
         self.month = 12
         self.year = self.year - 1
      default:
         self.month = tempMonth
      }
      self.yearLabel.text = "\(self.year)"
      // Update header
      self.monthHeader.text = "\(Date().nameOf(self.month)) \(self.year)"
      // Update days variable for the new month
      self.days = RealmQuery().workoutDaysIn(self.month, year: self.year)
      // Update days
      self.createDaysViewFor(self.month, inYear: self.year, change: change)
      // Animate the buttons the correct way
      UIView.animateWithDuration(0.3, animations: {
         // Iterate over all the buttons
         for a in self.dayButtonView.subviews {
            // Update the frame for the buttons
            a.frame.origin.x += CGFloat(-change) * self.dayButtonView.frame.w
            
         }
         }, completion: { Bool in
            // Get and remove the old view that held the buttons
            var view: UIView? = self.dayButtonView.subviews.first
            view?.removeFromSuperview()
            view = nil
            
      })
   }
   
   private func picked(day: Int) {
      // Set the day value to the day picked
      self.day = day
      // Update the top label to be correct
      self.topLabel.text = "\(Date().dayOfWeek(self.day, inMonth: self.month, year: self.year)[0...2]), \(Date().nameOf(self.month)[0...2]) \(self.day)"
      // Update the buttons to correct state
      for button in self.dayButtons {
         if button.label.text == "\(day)" {
            button.backgroundColor = .blue
            button.label.textColor = .white
         } else if (self.days.contains(Int(button.label.text!)!)) {
            button.label.textColor = .red
         } else {
            button.backgroundColor = .white
            button.label.textColor = .black
         }
      }
   }
   
}





