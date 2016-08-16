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
   This enum is for the different types new workout
 */
enum NewWorkoutType {
   
   case Standard // For when a User is creating a new workout
   case Edit // For when a User is editing a set
   
}

/**
    This class is used for the new workout view controller
 */
class NewWorkout: Controller {
   /// Holds the workout so far
   lazy var workout: Workout = {
      return Workout()
   }()
   lazy var header: BoldHeader = {
      return NewWorkoutStandardViews(controller: self).createHeader()
   }()
   /// The variable for the date picker
   private lazy var datePicker: DatePicker = {
      return NewWorkoutStandardViews(controller: self).createDatePicker()
   }()
   /// The varible for the tool tip that lets a user know a set was added
   private lazy var setAdded: ToolTip = {
      return NewWorkoutStandardViews(controller: self).createToolTip()
   }()
   /// Holds the date for the workout
   /// This Controller holds the type of new workout
   // TODO: Edit for when a User edits the set
   let type: NewWorkoutType = .Standard
   
   /// Holds the dictionary for text fields for validation
   var textFieldDict: [String : TextField] = [:]
   
   override func viewDidLoad() {
      // Call the supers method
      super.viewDidLoad()
      // Set up all the views
      self.setupViews()
      print(RealmQuery().all())
   }
   
   /**
      This function adds the current set to the workout
   */
   func addSet() {
      
      guard self.checkTextFields() != false else {
         return
      }
      // Get the rest for the current set
      let rest: Double = self.textFieldDict["Rest"]!.text!.timeToSeconds()
      // Create set for the data given
      let weightSet: WeightSet = WeightSet(name: self.textFieldDict["Exercise Name"]!.text!, setCount: self.workout.count, reps: Int(self.textFieldDict["Reps"]!.text!), restTime: rest, weight: Double(self.textFieldDict["Weight"]!.text!), time: nil, date: "\(Date().today())", complete: false, synced: false)
      // Add the set to the workout
      self.workout = self.workout.add(weightSet)
      // Show the User that the set go added
      self.setAdded.showWithAlpha()
      self.setAdded.hideWithAlpha(1.0)
      
   }
   
   func checkTextFields() -> Bool {
      // Valid fields
      var valid: [Bool] = []
      for textField in self.textFieldDict.values {
         valid += [textField.isValid()]
      }
      return !valid.contains(false)
   }
   
   /**
      This function adds the current workout to the DB Cloud and on Device
   */
   func showPicker() {
      // Add the date picker to the view
      self.view.addSubview(self.datePicker)
      // Show the date picker
      datePicker.showView()
      
   }
      
   func addWorkout() {
      print("Let's get the date")
      // Add the workout to the local DB
      self.workout = self.workout.updateDate(self.datePicker.date)
      print(self.workout)
//      let realmStore: RealmStore = RealmStore()
//      realmStore.store(workout: self.workout)
      
      
   }
   
   /**
      This method segues to preview the workout
   */
   func showPreview() {
      
      let vc: PreviewWorkout = PreviewWorkout()
      vc.workout = self.workout
      self.segueToPreviewAnimation(vc)

   }
   
   /**
      This function is for the animation between new workout and preview from a top right press
   */
   private func segueToPreviewAnimation(vc: PreviewWorkout) {
      
      // Hide the keyboard
      self.view.endEditing(true)
      self.resignFirstResponder()
      // Make sure workout isn't empty
      guard self.workout.count != 0 else {
         // Create the new workout set and then create the toast
         let toast: Toast = NewWorkoutStandardViews(controller: self).createToastWith(title: "Please add a set")
         // Show the toast
         toast.show()
         // Exit the function
         return
      }
      // Create the circular view
      let splashView: CircularView = CircularView(point: CGPoint(x: self.width - 29, y: 46), color: Color().white)
      // Add the circular view to the controller
      self.view.addSubview(splashView)
      // Animate the view to take up the whole screen
      UIView.animateWithDuration(0.25, animations: {
         splashView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 750.0, 750.0)
         }, completion: nil)
      // Add all the subviews to the view and segue to preview
      let previewViews: PreviewWorkoutViews = PreviewWorkoutViews(controller: vc)
      previewViews.layoutViewsWithAnimatedAlpha(self)
      
   }
   
   /**
      This function controls segues to other ViewControllers
   */
   override func segue(destination: Controller) {
      
      print("Fix this so we can segue")
      
      
   }
}

// MARK: Conformance to the View Setup protocol
extension NewWorkout : ViewSetup {
   /**
      This function adds all the views to the VC
   */
   func setupViews() {
      
      // Set the background color for the view
      self.view.backgroundColor = Color().white
      // Create the new workout views struct
      let newWorkoutViews: NewWorkoutStandardViews = NewWorkoutStandardViews(controller: self)
      // Add all the views to the contoller
      newWorkoutViews.layoutViews()
      
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







