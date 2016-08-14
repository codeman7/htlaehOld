//
//  Preview.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This view controller is for when a User wants to preview a workout while creating it
 */
class PreviewWorkout : Controller {
   // MARK: Preview
   // Variable for the FAB
   var FAB: Button? = nil
   // Variable for the workout that the VC will show
   lazy var workout: Workout = self.getWorkout()
   
   // MARK: View did load
   override func viewDidLoad() {
      // Call the super initializer
      super.viewDidLoad()
      // Layout views
      self.setupViews()
   }
   
   // MARK: Functions
   func getWorkout() -> Workout {
      
      var workout: Workout = Workout()
      let set: WeightSet = WeightSet(name: "Squat", setCount: 0, reps: 12, restTime: 75, weight: 225, time: nil, date: "160812", complete: false)
      let set1: WeightSet = WeightSet(name: "Deadlift", setCount: 1, reps: 8, restTime: 120, weight: 185, time: nil, date: "160812", complete: false)
      workout = workout.add(set)
      workout = workout.add(set1)
      return workout
      
   }
   
   func fabAction() {
      
   }
   
   func addMiniFABs() {
      
      self.FAB!.updateFAB(Color().red, image: Images.Navigation().close)
      let views: PreviewWorkoutViews = PreviewWorkoutViews(controller: self)
      let add: Button = views.createMiniFAB(Color().yellow, iconColor: Color().black, icon: Images.Content().add, action: { self.addMoreToWorkout() })
      let edit: Button = views.createMiniFAB(Color().blue, iconColor: Color().white, icon: Images.Editor().edit, action: { self.editSets() })
      self.view.addSubview(add)
      self.view.addSubview(edit)
      UIView.animateWithDuration(0.3, animations: {
         add.frame.origin.x = self.width - 128
         edit.frame.origin.y = self.height - 128
      })
      
   }
   
   func addMoreToWorkout() {
      
      print("Hey let's segue to New Workout and add some stuff")
      
   }
   
   func editSets() {
      
      print("Edit set")
      
   }
   
   func backToNewWorkout() {
      print("Segue back to new workout")
   }
   
}

// MARK: Make sure it conforms to view setup protocol
extension PreviewWorkout : ViewSetup {
   // This function lays out all the views
   func setupViews() {
      // Set the background color for the view
      self.view.backgroundColor = Color().white
      // Create the struct that will create all the views
      let views: PreviewWorkoutViews = PreviewWorkoutViews(controller: self)
      // Add all the views
      views.layoutViews()
      
   }
   
}






