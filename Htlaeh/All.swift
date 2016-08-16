//
//  All.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


class All : Controller {
   // MARK: Properties
   // TODO: Edit the all workout type to handle different types
   /// The workout for the VC
   lazy var workout: Workout = self.getWorkout()
   /// The variable to hold the FAB
   var FAB: Button? = nil
   
   // MARK: View did load
   override func viewDidLoad() {
      // Call the super
      super.viewDidLoad()
      // Layout views
      self.setupViews()
      
   }
   
   // MARK: Functions
   func getWorkout() -> Workout {
      
      var workout: Workout = Workout()
      let set: WeightSet = WeightSet(name: "Squat", setCount: 0, reps: 12, restTime: 75, weight: 225, time: nil, date: "160812", complete: false, synced: false)
      let set1: WeightSet = WeightSet(name: "Deadlift", setCount: 1, reps: 8, restTime: 120, weight: 185, time: nil, date: "160812", complete: false, synced: false)
      workout = workout.add(set)
      workout = workout.add(set1)
      return workout
      
   }
   /**
      This function shows the calendar from a press on the cal button in the header
   */
   func showCal() {
      print("Show calendar")
   }
   
   /**
      This function handles any touches from the FAB
   */
   func fabTouch() {
      
      print("Touch fab")
      
   }
   
   
   
   
   
   /**
    Use this function to segue back to a new workout from a preview
   */
   func backToNewWorkout() {
      
   }
   
}

// MARK: Conformance to View Setup protocol
extension All : ViewSetup {
   /// This function lays out all the views
   func setupViews() {
      // Set the background color
      self.view.backgroundColor = Color().white
      // Create the views struct
      let views: AllViews = AllStandardViews(controller: self)
      // Add all the views to the controller
      views.layoutViews()
      
   }
   
}

// MARK: All the navigation stuff
extension All {
   
   /// This function shows the menu
   func showMenu() {
      
      print("Show the menu")
      
   }
   
   /// This function hides the menu
   func hideMenu() {
      
      print("Hide menu")
      
   }
   
}






