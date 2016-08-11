//
//  All.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This enum is used to determine the type of All that should be shown
 */
enum AllWorkoutType {
   
   case All // Show all the workouts in the DB
   case Preview // Show the current workout being created
   case WorkoutStatus // Show the progress for the current workout
   
}

class All : Controller {
   // MARK: Properties
   // TODO: Edit the all workout type to handle different types
   /// The type of preview to show
   var type: AllWorkoutType? = .Preview
   /// The workout for the VC
   lazy var workout: Workout = self.getWorkout()
   
   // MARK: Functions
   func getWorkout() -> Workout {
      
      let workout: Workout = Workout()
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
      
   }
   
}

// MARK: Conformance to View Setup protocol
extension All : ViewSetup {
   /// This function lays out all the views
   func setupViews() {
      // Determine the type
      // Create the struct that returns all the views
      
      
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






