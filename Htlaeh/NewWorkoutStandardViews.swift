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
   /// The variable for the bottom of the exercise fields frame if nil then hasn't been set
   private var exerciseBottom: CGFloat = 172
   /// The variable for the top of the rest fieldsFrame if nil then hasn't been set
   private var restTop: CGFloat {
      return (self.size == .Large) ? self.controller.height - 411 : self.controller.height - 391
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
   func createViews() -> [UIView] {
      
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
      // Create the FAB
      let fab: Button = self.addFAB()
      // Create the Add set button
      let addSetButton: Button = self.addSetButton()
      // Create the array that will be returned
      return [exerciseName, reps, weight, rest, fab, addSetButton]
      
   }
   
   private func addSetButton() -> Button {
      // Get the x Position for the button
      let x: CGFloat = self.controller.width.halfCentered(side: .Left, size: 124)
      // Set the buttons frame
      let buttonFrame: CGRect = CGRect(x: x, y: 300, width: 124, height: 40)
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
      let exerciseNameFrame: Rect = Rect(x: 16, y: 74, w: self.controller.width - 32, h: 83)
      // Set the text fields options
      let exerciseNameOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Exercise Name", type: .All, style: TextFieldStyle.all)
      // Return the text field
      return TextField(frame: exerciseNameFrame, options: exerciseNameOptions)
      
   }
   
   /**
    This function creates the reps field
    */
   private func createRepsField() -> TextField {
      // Create the frame for the text field
      let repsFrame: Rect = Rect(x: self.controller.width / 2 - 120, y: 172, w: 88, h: 83)
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
      let weightFrame: Rect = Rect(x: self.controller.width - 104, y: 172, w: 88, h: 83)
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
      let restFrame: Rect = Rect(x: self.controller.width - 104, y: 271, w: 88, h: 83)
      // Set the text fields options
      let restOptions: TextFieldSettings = TextFieldSettings(placeHolder: "Rest", type: .Number, style: TextFieldStyle.numbers)
      // Return the text field
      return TextField(frame: restFrame, options: restOptions)
      
   }
   
}






