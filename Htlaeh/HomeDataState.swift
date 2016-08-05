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
         let anyWorkouts = WorkoutSets().anyWorkouts()
         if anyWorkouts == false {
            // No workouts in the DB new user
            return .New
         } else {
            // Workouts in the DB just none today
            return .Rest
         }
      }
      
   }
   
   func addViews(workout: Workout?, controller: Home) -> [UIView] {
      
      let state: HomeDataState = self.determineState(workout)
      let views: [UIView]
      switch state {
      case .New:
         views = controller.addNewContent()
      case .Rest:
         views = controller.addRestContent()
      case .Standard:
         views = controller.addStandardContent()
      }
      return views
      
   }
   
}






