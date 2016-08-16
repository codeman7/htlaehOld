//
//  NewWorkoutViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct NewWorkoutStandardViews {
   // MARK: Properties
   /// The controller that will be holding the views
   let controller: NewWorkout
   /// The size of the screen for the view controller holding that will be holding the views
   private var size: ScreenSize {
      switch self.controller.view.frame.size {
      case CGSize(width: 320, height: 568):
         return .Small
      case CGSize(width: 375, height: 667):
         return .Medium
      case CGSize(width: 414, height: 736):
         return .Large
      default:
         return .Small
      }
   }
   // The height the keyboard will be
   private var keyboardTop: CGFloat {
      switch self.size {
      case .Small:
         return 352
      case .Medium:
         return 451
      case .Large:
         return 510
      }
   }
   /// The variable for the bottom of the exercise fields frame if nil then hasn't been set
   private var exerciseBottom: CGFloat = 172
   /// The variable for the top of the rest fieldsFrame if nil then hasn't been set
   private var padding: CGFloat {
      // Get the space between the top of the keyboard and the bottom of exercise name
      // 249 is 83 * 3 because all text fields will be 83 tall + 70 for header
      let totalSpace: CGFloat = self.keyboardTop - 319
      // Get the padding that will be between all the views
      return totalSpace / 4
   }
   
   // MARK: Initializer
   /**
    Default and only initalizer
    - parameter controller: The View controller that will hold all the views
   */
   init(controller: NewWorkout) {
      self.controller = controller
   }
   
   func layoutViews() {
      
      // Get the big button
      let bigButton: Button = self.dismissKeyboardButton()
      // Add the button to the view
      self.controller.view.addSubview(bigButton)
      // Get the header
      let header: BoldHeader = self.createHeader()
      // Add the header to the view
      self.controller.view.addSubview(header)
      // Get the buttons
      let buttons: [Button] = self.createButtons()
      // Add the buttons to the view
      for button in buttons {
         self.controller.view.addSubview(button)
      }
      // Get the text fields
      let textFields: [String : TextField] = self.createTextFields()
      // Set the text fields to the textFieldDict property
      self.controller.textFieldDict = textFields
      // Iterate over the dictionary to add them to the controller
      for textField in textFields.values {
         self.controller.view.addSubview(textField)
      }
      
   }
   
   func layoutViewsWithAlpha(oldController oldController: Controller) {
      
      var views: [UIView] = []
      // Get the header
      let header: BoldHeader = self.createHeader()
      views += [header]
      /*header.alpha = 0.0
      oldController.view.addSubview(header)*/
      // Get the buttons
      let buttons: [Button] = self.createButtons()
      for button in buttons {
         views += [button]
         /*button.alpha = 0.0
         oldController.view.addSubview(button)*/
      }
      // Get the text fields
      let textFields: [String : TextField] = self.createTextFields()
      for textField in textFields.values {
         views += [textField]
         /*textField.alpha = 0.0
         oldController.view.addSubview(textField)*/
      }
      for view in views {
         view.alpha = 0.0
         oldController.view.addSubview(view)
      }
      
      // Animate views alphas and present new contoller
      UIView.animateWithDuration(0.3, delay: 0.25, options: .CurveEaseInOut, animations: {
         for view in views {
            view.alpha = 1.0
         }
         }, completion: { Bool in
               oldController.presentViewController(self.controller, animated: false, completion: nil)
      })
      
   }
   
   // MARK: Functions
   /**
      This function creates and returns all the buttons
   */
   func createButtons() -> [Button] {
      
      // Create the FAB
      let fab: Button = self.addFAB()
      // Create the Add set button
      let addSetButton: Button = self.addSetButton()
      // Create the array that will be returned
      return [fab, addSetButton]
      
   }
   
   /**
      This function creates and returns the text fields
   */
   func createTextFields() -> [String : TextField] {
      
      // Create the exercise name text field
      let exerciseName: TextField = self.exerciseNameField()
      // Open up the keyboard for exercise name
      exerciseName.becomeFirstResponder()
      // Create the reps text field
      let reps: TextField = self.createRepsField()
      // Create the weight text field
      let weight: TextField = self.createWeightField()
      // Create the rest field
      let rest: TextField = self.createRestField()
      // Return the text fields
      return ["Exercise Name" : exerciseName, "Reps" : reps, "Weight" : weight, "Rest" : rest]
      
   }
   
   /**
      This function creates and returns the header for the new workout VC
   */
   func createHeader() -> BoldHeader {
      
      // Set the headers frame
      let headerFrame: CGRect = CGRect(x: 0, y: 0, width: self.controller.width, height: 70)
      // Create the header type and set its default values
      let headerOptions: HeaderType = HeaderType.new(controller: self.controller)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: headerFrame, options: headerOptions)
      // Return the header
      return header
      
   }
   
   /**
      This function creates the date picker for the controller
   */
   func createDatePicker() -> DatePicker {
      // Create the frame for the prompt
      let promptFrame: Rect = Rect(x: self.controller.width / 2 - 144, y: self.controller.height / 2 - 256, w: 288, h: 512)
      // Create the date picker
      let datePicker: DatePicker = DatePicker(frame: self.controller.view.frame, promptFrame: promptFrame, month: 8, year: 2016)
      // Set the date picker's right button action
      datePicker.rightButtonAction = { self.controller.addWorkout() }
      // Set the date pickers left button action
      datePicker.leftButtonAction = { datePicker.hideView() }
      // Return the date picker
      return datePicker
      
   }
   
   /**
      This function creates the tool tip that will let the user know a set was added
   */
   func createToolTip() -> ToolTip {
      // Get the width for the view
      let width: CGFloat = "Set added".widthWithConstrainedHeight(16.0, font: Fonts.Medium().fourteen) + 32
      // Set the frame for the view
      let origin: CGPoint = CGPoint(x: self.controller.width - (width + 72), y: 31)
      // Create the view
      let toolTip: ToolTip = ToolTip(origin: origin, text: "Set added")
      // Set the view's alpha to 0
      toolTip.alpha = 0.0
      // Add the view as a subview
      self.controller.view.addSubview(toolTip)
      // Return the view
      return toolTip
   }
   
   /**
      This function returns the button that dismisses the keyboard
   */
   func dismissKeyboardButton() -> Button {
      
      let buttonFrame: Rect = Rect(x: 0, y: 68, w: self.controller.width, h: self.controller.height - 68)
      let button: Button = Button(frame: buttonFrame, type: .Flat)
      button.action = { self.controller.hideKeyboard() }
      button.backgroundColor = .clearColor()
      return button
      
   }
   
   private func addSetButton() -> Button {
      // Get the x Position for the button
      let x: CGFloat = self.controller.width.halfCentered(side: .Left, size: 124)
      // Set the buttons frame
      let buttonFrame: CGRect = CGRect(x: x, y: (257 + padding * 3), width: 124, height: 40)
      // Create the button
      let addSet: Button = Button(frame: buttonFrame, type: .Raised)
      // Set the buttons background color
      addSet.backgroundColor = Color().blue
      // Add the title to the button
      addSet.add(title: "ADD SET", color: Color().white)
      // Set the buttons action
      addSet.action = { self.controller.addSet() }
      // Return the button
      return addSet
      
   }
   
   private func addFAB() -> Button {
      
      // Set the fabs frame
      let fabFrame: CGRect = CGRect(x: self.controller.view.frame.w / 2 - 28, y: self.controller.view.frame.h / 5 * 4 - 28, width: 56, height: 56)
      // Create the fab
      let fab: Button = Button(frame: fabFrame, type: .FAB)
      // Set the fab's background color
      fab.backgroundColor = Color().yellow
      // Add an icon to the fab
      fab.add(image: Images.Navigation().check, color: Color().black)
      // Set the FAB's action
      fab.action = { self.controller.showPicker() }
      // Return the fab
      return fab
      
   }
   
   /**
      This function creates the toast for a new workout
      - parameter title: The title for the toast
   */
   func createToastWith(title title: String) -> Toast {
      // Set the frame for the toast
      let frame: Rect = Rect(x: 0, y: self.controller.height, w: self.controller.width, h: 48)
      // Create the toast
      let toast: Toast = Toast(frame: frame, text: title)
      // Add the toast to the controller
      self.controller.view.addSubview(toast)
      // Return the toast
      return toast
      
   }
   
   
   // MARK: Text field creation
   /**
      This function creates the exercise name field
   */
   private func exerciseNameField() -> TextField {
      // Create the frame for the text field
      let exerciseNameFrame: Rect = Rect(x: 16, y: (70 + padding), w: self.controller.width - 32, h: 83)
      // Set the text fields options
      let exerciseNameOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Exercise Name", type: .All, style: TextFieldStyle.all)
      // Create the text field
      let exerciseName: TextField = TextField(frame: exerciseNameFrame, options: exerciseNameOptions)
      // Check the screen size if it isn't small then allow auto correct
      if self.size != .Small { exerciseName.autocorrectionType = .Default }
      // Return the text field
      return exerciseName
      
   }
   
   /**
    This function creates the reps field
    */
   private func createRepsField() -> TextField {
      // Create the frame for the text field
      let repsFrame: Rect = Rect(x: self.controller.width / 2 - 128, y: (153 + padding * 2), w: 96, h: 83)
      // Set the text fields options
      let repsOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Reps", type: .Number, style: TextFieldStyle.numbers)
      // Return the text field
      return TextField(frame: repsFrame, options: repsOptions)
      
   }
   
   /**
    This function creates the weight field
    */
   private func createWeightField() -> TextField {
      
      // Create the frame for the text field
      let weightFrame: Rect = Rect(x: self.controller.width - 112, y: (153 + padding * 2), w: 96, h: 83)
      // Set the text fields options
      let weightOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Weight", type: .Number, style: TextFieldStyle.numbers)
      // Return the text field
      return TextField(frame: weightFrame, options: weightOptions)
      
   }
   
   /**
    This function creates the rest field
    */
   private func createRestField() -> TextField {
      // Create the frame for the text field
      let restFrame: Rect = Rect(x: self.controller.width - 112, y: (236 + padding * 3), w: 96, h: 83)
      // Set the text fields options
      let restOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Rest", type: .Time, style: TextFieldStyle.time)
      // Return the text field
      let field = TextField(frame: restFrame, options: restOptions)
      return field
      
   }
   
}






