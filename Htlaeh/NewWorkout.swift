//
//  NewWorkout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
    This class is used for the new workout view controller
 */
class NewWorkout: Controller {
   /// Holds the workout so far
   var workout: Workout = Workout()
   /// Holds the date for the workout
   
   /// Holds the dictionary for text fields for validation
   var textFieldDict: [String : TextField] = [:]
   
   override func viewDidLoad() {
      // Call the supers method
      super.viewDidLoad()
      // Set up all the views
      self.setupViews()
   }
   
   
   /**
      This function adds the current set to the workout
   */
   func addSet() {
      
      let goodValues: Bool = self.checkTextFields()
      if goodValues == true {
         print("Adding workout")
         let weightSet: WeightSet = WeightSet(name: self.textFieldDict["Exercise Name"]!.text!, setCount: self.workout.count, reps: Int(self.textFieldDict["Reps"]!.text!), restTime: Double(self.textFieldDict["Rest"]!.text!), weight: Double(self.textFieldDict["Weight"]!.text!), time: nil, date: "", complete: false)
         print("Set = \(weightSet)")
         self.workout.add(weightSet)
      }
      print("Workout = \(self.workout)")
      
   }
   
   func checkTextFields() -> Bool {
      
      for textField in self.textFieldDict.values {
         
         if textField.text == nil || textField.text == "" {
            textField.showErrorMessage("Required")
            if textField.isFirstResponder() {
               textField.style(.nonActiveError)
            } else {
               textField.style(.required)
            }
            return false
         }
         
      }
      return true
      
   }
   
   /**
      This function adds the current workout to the DB Cloud and on Device
   */
   func addWorkout() {
      
   }
   
   /**
      This method segues to preview the workout
   */
   func showPreview() {
      
      print("Segue to preview so far the workout is \(self.workout)")
      
   }
   
   /**
      This function controls segues to other ViewControllers
   */
   override func segue(destination: NavigationDestinations) {
      
      print("Fix this so we can segue")
      
   }
}

extension NewWorkout : ViewSetup {
   /**
      This function adds all the views to the VC
   */
   func setupViews() {
      
      // Set the background color for the view
      self.view.backgroundColor = Color().white
      // Create the new workout views struct
      let newWorkoutViews: NewWorkoutStandardViews = NewWorkoutStandardViews(controller: self)
      // Get the keyboard dismissal button
      let bigButton: Button = newWorkoutViews.dismissKeyboardButton()
      // Add the button to the view
      self.view.addSubview(bigButton)
      // Get the header from new workout views struct
      let header: BoldHeader = newWorkoutViews.createHeader()
      // Add the header as subview
      self.view.addSubview(header)
      // Get all the buttons to add to the view
      let buttons: [Button] = newWorkoutViews.createButtons()
      // Iterate over the views and add them to the VC
      for button in buttons {
         self.view.addSubview(button)
      }
      // Get all the text fields to add to the view and set them to the 'textFieldDict' property
      self.textFieldDict = newWorkoutViews.createTextFields()
      // Iterate over the dictionary and add the viewws to the VC
      for textField in self.textFieldDict.values {
         self.view.addSubview(textField)
      }
      
   }
   
   func hideKeyboard() {
      self.resignFirstResponder()
      self.view.endEditing(true)
   }
   
}

// MARK: This extension is for all menu related items
extension NewWorkout {
   
   /// This method shows the menu and adds it to the vc
   func showMenu() {
      
   }
   
   /// This method hides the menu
   func hideMenu() {
      
   }
   
}







