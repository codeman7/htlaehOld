//
//  WorkoutSets.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/3/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import RealmSwift

struct WorkoutSets {
   fileprivate let realm = try! Realm()
   
   
   func setsForDate(date: String) -> Results<RealmWorkout> {
      
      let workoutSet = self.realm.objects(RealmWorkout.self).filter("date = '\(date)'")
      return workoutSet
      
   }
   
   func isEmpty(date: String) -> Bool {
      
      let results = self.setsForDate(date: date)
      return (results.count == 0) ? true : false
      
   }
   
   func sortedBySetCount(date: String) -> Workout {
      
      let results = self.setsForDate(date: date).sorted("setCount")
      let returnWorkout: Workout = Workout()
      for workoutSet in results {
         let weightSet: WeightSet = WeightSet(workoutSet: workoutSet)
         returnWorkout.add(weightSet)
      }
      return returnWorkout
      
   }
   
   func getWorkout(date: String) -> Workout? {
      
      guard self.isEmpty(date: date) != true else { return nil }
      return self.sortedBySetCount(date: date)
      
   }
   
   func anyWorkouts() -> Bool {
      
      let workoutSet = self.realm.objects(RealmWorkout.self)
      if workoutSet.count == 0 {
         return false
      } else {
         return true
      }
      
   }
   
}
