//
//  RealmStore.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/15/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import RealmSwift
/**
   This struct is used to store workouts into the db
 */
struct RealmStore {
   let realm: Realm = try! Realm()
   
   /**
      This function stores the workout into the DB
      - parameter workout: The workout that needs to be stored
   */
   func store(workout workout: Workout) {
      // Assign the workout to a temporary variable
      var tempWorkout = workout
      // Check to see if a workout already exist for given day if so update the set count
      let newSetCount = self.check(date: workout.date)
      if newSetCount != nil {
         tempWorkout = workout.updateSetCount(to: newSetCount!)
      }
      
      // Iterate over sets
      for workoutSet in tempWorkout.sets {
         // Create the set
         let set: RealmWorkout = RealmWorkout().createSet(workoutSet)
         // Store the set in the DB
         try! realm.write({ realm.add(set) })
      }
      
   }
   
   func check(date i: Int) -> Int? {
     
      // Get the workout for a given day
      let workout = RealmQuery().getWorkoutFor(date: "\(i)")
      // Get the return value
      let int: Int? = (workout == nil) ? nil : workout!.count
      // Return either nil or the new set count
      return int
      
   }
   
   func done(set set: RealmWorkout) {
      
      try! realm.write({ set.complete = true })
      
   }
   
}