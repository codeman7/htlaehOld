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
      addSet.addTitle("ADD SET", color: Color().white)
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
      fab.addIcon(Images.Navigation().check, color: Color().black)
      // Set the FAB's action
      fab.action = { self.controller.addWorkout() }
      // Return the fab
      return fab
      
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






