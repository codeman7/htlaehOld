//
//  NewWorkoutViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct NewWorkoutStandardViews : ViewsStruct {
   // MARK: Properties
   /// The controller that will be holding the views
   let controller: NewWorkout
   /// The size of the screen for the view controller holding that will be holding the views
   fileprivate var size: ScreenSize {
      switch self.controller.view.frame.size {
      case CGSize(width: 320, height: 568):
         return .small
      case CGSize(width: 375, height: 667):
         return .medium
      case CGSize(width: 414, height: 736):
         return .large
      default:
         return .small
      }
   }
   // The height the keyboard will be
   fileprivate var keyboardTop: CGFloat {
      switch self.size {
      case .small:
         return 352
      case .medium:
         return 451
      case .large:
         return 510
      }
   }
   /// The variable for the bottom of the exercise fields frame if nil then hasn't been set
   fileprivate var exerciseBottom: CGFloat = 172
   /// The variable for the top of the rest fieldsFrame if nil then hasn't been set
   fileprivate var padding: CGFloat {
      // Get the space between the top of the keyboard and the bottom of exercise name
      // 249 is 83 * 3 because all text fields will be 83 tall + 70 for header
      let totalSpace: CGFloat = self.keyboardTop - 319
      // Get the padding that will be between all the views
      return totalSpace / 4
   }
   
   /// The variable for the views
   var views: [UIView : (delay: Double, alpha: CGFloat)] = [:]
   
   // MARK: Initializer
   /**
    Default and only initalizer
    - parameter controller: The View controller that will hold all the views
   */
   init(controller: NewWorkout) {
      self.controller = controller
   }
   
   init<T : Controller>(controller: T) {
      self.controller = controller as! NewWorkout
   }
   
   mutating func layoutViews() {

      // Get the big button that will dismiss the keyboard
      let bigButton: Button = self.dismissKeyboardButton()
      // Add the button to the view
      self.controller.view.addSubview(bigButton)
      
      // Get the header and add it to the view
      let header: BoldHeader = self.createHeader()
      self.controller.view.addSubview(header)
      
      // Set the headers alpha and add it to the views dict
      header.alpha = 0.0
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Create the text field dict and set it to the controllers text field
      let textFields: [String : TextField] = self.createTextFields()
      self.controller.textFieldDict = textFields
      
      // Add the text field to the view and set it's alpha to 0
      for textField in textFields.values {
         self.controller.view.addSubview(textField)
         textField.alpha = 0.0
      }
      
      // Add the fab to the controllers view and set it's alpha to 0
      self.controller.view.addSubview(self.controller.FAB)
      self.controller.FAB.alpha = 0.0
      // Add the fab to the views dict
      self.views[self.controller.FAB] = (delay: 0.1, alpha: 1.0)
      
      // Create the add set button and add it to the view controller
      let addButton: Button = self.addSetButton()
      self.controller.view.addSubview(addButton)
      
      // Set the buttons alpha to 0 and add it to the views dict
      addButton.alpha = 0.0
      self.views[addButton] = (delay: 0.075, alpha: 1.0)
      
   }
   
   mutating func layoutViewsWithAlpha(oldController: Controller) {
      
      var views: [UIView] = []
      // Get the header
      let header: BoldHeader = self.createHeader()
      views += [header]
      // Get the add set buttons
      let addSetButton: Button = self.addSetButton()
      views += [addSetButton]
      // Get the FAB
      let fab: Button = self.createFAB()
      views += [fab]
      // Get the text fields
      let textFields: [String : TextField] = self.createTextFields()
      for textField in textFields.values {
         views += [textField]
      }
      for view in views {
         view.alpha = 0.0
         oldController.view.addSubview(view)
      }
      
      // Animate views alphas and present new contoller
      UIView.animate(withDuration: 0.3, delay: 0.25, options: UIViewAnimationOptions(), animations: {
         for view in views {
            view.alpha = 1.0
         }
         }, completion: { Bool in
               oldController.present(self.controller, animated: false, completion: nil)
      })
      
   }
   
   // MARK: Functions
   /**
      This function creates and returns the text fields
   */
   mutating func createTextFields() -> [String : TextField] {
      
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
      let datePicker: DatePicker = DatePicker(frame: self.controller.view.frame, promptFrame: promptFrame)
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
      let width: CGFloat = "Set added".widthWithConstrainedHeight(16.0, font: Fonts.Medium.fourteen) + 32
      // Set the frame for the view
      let origin: CGPoint = CGPoint(x: self.controller.width - (width + 60), y: 31)
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
      let button: Button = Button(frame: buttonFrame, type: .flat)
      button.action = { self.controller.hideKeyboard() }
      button.backgroundColor = .clear()
      return button
      
   }
   
   fileprivate func addSetButton() -> Button {
      // Get the x Position for the button
      let x: CGFloat = self.controller.width.halfCentered(side: .left, size: 124)
      // Set the buttons frame
      let buttonFrame: CGRect = CGRect(x: x, y: (257 + padding * 3), width: 124, height: 40)
      // Create the button
      let addSet: Button = Button(frame: buttonFrame, type: .raised)
      // Set the buttons background color
      addSet.backgroundColor = .blue
      // Add the title to the button
      addSet.set(title: "ADD SET", color: .white)
      // Set the buttons action
      addSet.action = { self.controller.addSet() }
      // Return the button
      return addSet
      
   }
   
   func createFAB() -> Button {
      
      // Set the fabs frame
      let fabFrame: CGRect = CGRect(x: self.controller.view.frame.w / 2 - 28, y: self.controller.view.frame.h / 5 * 4 - 28, width: 56, height: 56)
      // Create the fab
      let fab: Button = Button(frame: fabFrame, type: .fab)
      // Set the fab's background color
      fab.backgroundColor = .yellow
      // Add an icon to the fab
      fab.add(image: Images.Navigation().check, color: .black)
      // Set the FAB's action
      fab.action = { self.controller.showPicker() }
      // Return the fab
      return fab
      
   }
   
   /**
      This function creates the toast for a new workout
      - parameter title: The title for the toast
   */
   func createToastWith(title: String) -> Toast {
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
   fileprivate mutating func exerciseNameField() -> TextField {
      // Create the frame for the text field
      let exerciseNameFrame: Rect = Rect(x: 16, y: (70 + padding), w: self.controller.width - 32, h: 83)
      // Set the text fields options
      let exerciseNameOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Exercise Name", type: .all, style: TextFieldStyle.all)
      // Create the text field
      let exerciseName: TextField = TextField(frame: exerciseNameFrame, options: exerciseNameOptions)
      // Check the screen size if it isn't small then allow auto correct
      if self.size != .small { exerciseName.autocorrectionType = .default }
      // Set the delay and alpha for the text field
      self.views[exerciseName] = (delay: 0.025, alpha: 1.0)
      // Return the text field
      return exerciseName
      
   }
   
   /**
    This function creates the reps field
    */
   fileprivate mutating func createRepsField() -> TextField {
      // Create the frame for the text field
      let repsFrame: Rect = Rect(x: self.controller.width / 2 - 128, y: (153 + padding * 2), w: 96, h: 83)
      // Set the text fields options
      let repsOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Reps", type: .number, style: TextFieldStyle.numbers)
      // Create the field
      let field: TextField = TextField(frame: repsFrame, options: repsOptions)
      // Set the delay and alpha for the text field
      self.views[field] = (delay: 0.05, alpha: 1.0)
      // Return the text field
      return field
      
   }
   
   /**
    This function creates the weight field
    */
   fileprivate mutating func createWeightField() -> TextField {
      
      // Create the frame for the text field
      let weightFrame: Rect = Rect(x: self.controller.width - 112, y: (153 + padding * 2), w: 96, h: 83)
      // Set the text fields options
      let weightOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Weight", type: .number, style: TextFieldStyle.numbers)
      // Create the field
      let field: TextField = TextField(frame: weightFrame, options: weightOptions)
      // Set the delay and alpha for the text field
      self.views[field] = (delay: 0.05, alpha: 1.0)
      // Return the text field
      return field
      
   }
   
   /**
    This function creates the rest field
    */
   fileprivate mutating func createRestField() -> TextField {
      // Create the frame for the text field
      let restFrame: Rect = Rect(x: self.controller.width - 112, y: (236 + padding * 3), w: 96, h: 83)
      // Set the text fields options
      let restOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Rest", type: .time, style: TextFieldStyle.time)
      // Create the field
      let field: TextField = TextField(frame: restFrame, options: restOptions)
      // Set the delay and alpha for the text field
      self.views[field] = (delay: 0.075 ,alpha: 1.0)
      // Return the field
      return field
      
   }
   
}






