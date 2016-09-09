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
   
   case standard // For when a User is creating a new workout
   case edit // For when a User is editing a set
   
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
   /// The variable for the FAB
   lazy var FAB: Button = {
      return NewWorkoutStandardViews(controller: self).createFAB()
   }()
   /// Holds the date for the workout
   /// This Controller holds the type of new workout
   // TODO: Edit for when a User edits the set
   let type: NewWorkoutType = .standard
   
   /// Holds the dictionary for text fields for validation
   var textFieldDict: [String : TextField] = [:]
   
   override func viewDidLoad() {
      // Call the supers method
      super.viewDidLoad()
      // Set up all the views
      print("We are in new workout")

      self.setupViews()
   }
   
   /**
      This function adds the current set to the workout
   */
   func addSet() {
      // Make sure all the text fields are good
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

      // Make sure workout isn't empty
      guard self.workout.sets.count != 0 else {
         self.addSetToast()
         return
      }
      // Add the date picker to the view
      self.view.addSubview(self.datePicker)
      // Show the date picker
      datePicker.showView()
      
   }
      
   func addWorkout() {

      // Set the workouts date to the correct date
      self.workout = self.workout.updateDate(self.datePicker.date)
      // Store the workout in the DB
      let realmStore: RealmStore = RealmStore()
      realmStore.store(self.workout)
      print(self.datePicker.date)
      // Hide the Date Picker
      self.datePicker.hideView()
      // Set the workout back to empty
      self.workout = Workout()
      // Show animation to let user know workout was added
      self.animateFAB()
      // Add the add workout tool tip
      self.addWorkoutToast()
      // Set all text field's values to blank
      for textField in textFieldDict.values {
         textField.text = ""
      }
     
      
   }
   
   /**
      This method segues to preview the workout
   */
   func showPreview() {
      
      let vc: PreviewWorkout = PreviewWorkout()
      vc.workout = self.workout
      self.segueToPreviewAnimation(vc)

   }
   
   private func animateFAB() {
      // Draw circle around FAB
      let fabAnimationFrame: Rect = Rect(x: self.FAB.frame.origin.x - 7, y: self.FAB.frame.origin.y - 7, w: self.FAB.frame.w + 14, h: self.FAB.frame.h + 14)
      let fabAnimation: FABAnimation = FABAnimation(frame: fabAnimationFrame)
      self.view.addSubview(fabAnimation)
      fabAnimation.animateCircle(1.3)
      // Change FAB color to blue
      UIView.animateWithDuration( 0.4, delay: 1.3, options: UIViewAnimationOptions(), animations: {
         self.FAB.backgroundColor = .blue
         self.FAB.icon?.colorImage(.white)
         }, completion: { Bool in
            UIView.animateWithDuration( 0.4, delay: 0.0, options: UIViewAnimationOptions(), animations: {
               self.FAB.backgroundColor = .yellow
               self.FAB.icon?.colorImage(.black)
               }, completion: { Bool in
                  UIView.animateWithDuration( 0.4, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                     fabAnimation.alpha = 0.0
                     }, completion: { Bool in
                        fabAnimation.removeFromSuperview()
                        let exercise = self.textFieldDict["Exercise Name"]
                        exercise?.becomeFirstResponder()
                  })
            })
      })
      
   }
   
   func addWorkoutToast() {
      // Create toast frame and create toast, add to view
      let toast: Toast = NewWorkoutStandardViews(controller: self).createToastWith("Workout added")
      self.view.addSubview(toast)
      
      // Show the toast
      toast.show()
      
   }
   
   func addSetToast() {
      
      // Create the new workout set and then create the toast and show the toast
      let toast: Toast = NewWorkoutStandardViews(controller: self).createToastWith("Please add a set")
      toast.show()
   }
   
   /**
      This function is for the animation between new workout and preview from a top right press
   */
   private func segueToPreviewAnimation(vc: PreviewWorkout) {
      
      // Create the struct that will handle the segue and perform the segue
      let newToPreview: NewToPreview = NewToPreview(new: self, preview: vc)
      newToPreview.segue()
      
   }
   
}

// MARK: Conformance to the View Setup protocol
extension NewWorkout : ViewSetup {
   /**
      This function adds all the views to the VC
   */
   func setupViews() {
      
      // Set the background color for the view
      self.view.backgroundColor = .white
      // Create the new workout views struct
      var newWorkoutViews: NewWorkoutStandardViews = NewWorkoutStandardViews(controller: self)
      // Add all the views to the contoller
      newWorkoutViews.layoutViews()
      // Show the views
      newWorkoutViews.show()
      
      /*self.view.addSubview(self.menu)
      self.menu.showViewInstant()
      self.hideMenu()*/
      
   }
   
   func hideKeyboard() {
      self.resignFirstResponder()
      self.view.endEditing(true)
   }
   
}









