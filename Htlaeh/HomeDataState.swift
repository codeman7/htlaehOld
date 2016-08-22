//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/4/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit
/**
   This enum is used to identify the different states the data may be in
 */
enum HomeDataState {
   
   case New // Brand new user
   case Rest // There are workouts there but not a new user
   case Standard // There is a workout for the given day
   
}

struct HomeData {
   
   private func determineState(workout: Workout?) -> HomeDataState {
      // Check if workout is there
      if workout != nil {
         // It is there so return Standard
         return .Standard
      } else {
         // No workout for today
         // Check to see if any workouts are in the DB
         let anyWorkouts = RealmQuery().all()
         if anyWorkouts.isEmpty == true {
            // No workouts in the DB new user
            return .New
         } else {
            // Workouts in the DB just none today
            return .Rest
         }
      }
      
   }
   
   /**
      This function lays out all the views for the home View Controller
      - parameter workout: The workout for the controller
      - parameter controller: The controller that will hold all the views
   */
   func addViews(workout: Workout?, controller: Home) {
      // Get the current state
      let state: HomeDataState = self.determineState(workout)
      // Create the variable that will show the views
      var views: ViewsStruct
      // Determine what views to show
      switch state {
      case .New:
         views = HomeWelcomeViews(controller: controller)
      case .Rest:
         views = HomeRestViews(controller: controller)
      case .Standard:
         views = HomeStandardViews(controller: controller)
      }
      // Layout all the views
      views.layoutViews()
      // Bring the views to life
      views.show()
      
   }
   
}






