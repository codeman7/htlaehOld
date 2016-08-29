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
      // Iterate over sets
      for workoutSet in workout.sets {
         // Create the set
         let set: RealmWorkout = RealmWorkout().createSet(workoutSet)
         // Store the set in the DB
         try! realm.write({ realm.add(set) })
      }
      
   }
   
   func done(set set: RealmWorkout) {
      
      try! realm.write({ set.complete = true })
      
   }
   
}