//
//  RealmQuery.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/15/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import RealmSwift

/**
   This struct is used to get workouts from the DB
 */
struct RealmQuery {
   let realm: Realm = try! Realm()
   
   /**
      This function gets all workouts from the DB
   */
   func all() -> Results<RealmWorkout> {
      
      let workouts: Results<RealmWorkout> = self.realm.objects(RealmWorkout.self)
      return workouts
      
   }
   
   /**
    Fetches a workout for a certain date in the DB
    - parameter date: Should be in "yymmdd" format and the date the workout is
    - returns: Workout for the date specified
   */
   func getWorkoutFor(date date: String) -> Workout {
      
      let workouts: Results<RealmWorkout> = self.realm.objects(RealmWorkout.self).filter("date = '\(date)'").sorted("setCount")
      var workout: Workout = Workout()
      for workoutSet in workouts {
         let weightSet: WeightSet = WeightSet(workoutSet: workoutSet)
         workout = workout.add(weightSet)
      }
      
      return workout
      
   }
   
   func workoutDaysIn(month month: Int, year: Int) -> [Int] {
      
      let y: Int = year - 2000
      let dateString: String = (month > 9) ? "\(y)\(month)" : "\(y)0\(month)"
      let workouts: Results<RealmWorkout> = self.realm.objects(RealmWorkout.self).filter("date BEGINSWITH '\(dateString)'")
      var dates: [Int] = []
      for workout in workouts {
         let day = Int(workout.date)! % 100
         if !dates.contains(day) {
            dates += [day]
         }
      }
      return dates
      
   }
}






