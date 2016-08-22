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
   func all() -> [Workout] {
      // Get all the workouts then sort them by date
      let workouts: Results<RealmWorkout> = self.realm.objects(RealmWorkout.self)
      // Make sure there are workouts in the DB
      guard workouts.isEmpty == false else { return [] }
      let workoutsSortedByDate: Results<RealmWorkout> = workouts.sorted("date")
      // Create and array to hold all the workouts
      var work: [Workout] = []
      // Set the date to the first workouts date
      var date = workoutsSortedByDate[0].date
      // Iterate over all the workouts and seperate them by date
      for workout in workoutsSortedByDate {
         if workout.date != date {
            // The date isn't the same as the set before so create a new workout and add it to the array
            let currentSet = WeightSet(workoutSet: workout)
            date = currentSet.date
            let w: Workout = Workout(firstSet: currentSet)
            work += [w]
         } else {
            // The date is the same so add it to the current workout
            var currentWorkout: Workout
            if work.isEmpty {
               currentWorkout = Workout()
               work += [currentWorkout]
            } else {
               currentWorkout = work[work.count - 1]
            }
            let currentSet = WeightSet(workoutSet: workout)
            currentWorkout = currentWorkout.add(currentSet)
            work[work.count - 1] = currentWorkout
         }
      }
      return work
      
   }
   
   /**
    Fetches a workout for a certain date in the DB
    - parameter date: Should be in "yymmdd" format and the date the workout is
    - returns: Workout for the date specified
   */
   func getWorkoutFor(date date: String) -> Workout? {
      
      let workouts: Results<RealmWorkout> = self.realm.objects(RealmWorkout.self).filter("date = '\(date)'").sorted("setCount")
      guard workouts.count != 0 else {
         return nil
      }
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
   
   func suggestionsFor(text text: String) -> [String] {
      
      return []
      
   }
   
   func statsFor(exercise exercise: String) -> StatViewData {
      // Get all the workouts in the database
//      let workouts: Results<RealmWorkout> = realm.objects(RealmWorkout).filter("name = '\(exercise)'")
      let workouts: Results<RealmWorkout> = realm.objects(RealmWorkout).filter("name = 'Squat'")
      // Get the highest weight in the database
      let personalBest: Int = Int(workouts.sorted("weight").last!.weight.value!)
      // Get the total number of sets in the database
      let sets: Int = workouts.count
      // Get the total number of reps in the database
      let reps: Int = workouts.reduce(0, combine: { (total, next) in total + next.reps.value! })
      // Get the total weight for all the set completed
      let weight: Int = workouts.reduce(0, combine: { (total, next) in total + (next.reps.value! * Int(next.weight.value!)) })
      // Create the stats view struct and return it
      return StatViewData(best: personalBest, reps: reps, sets: sets, weight: weight)
      
   }
   
   /**
    Returns all the workouts seperated by the weeks
    - parameter first: The date of the first workout
    - parameter last: The date of the last workout
   */
   func workoutsByWeeksFrom(first: Int, to last: Int) -> [[Workout]] {
      
      let weeks: [(sunday: Int, saturday: Int)] = Date().getWeeksBetween(start: Date.from(first), andEnd: Date.from(last))
      let workouts: [Workout] = self.all()
      var returnArr: [[Workout]] = [[Workout]](count: weeks.count, repeatedValue: [])
      var currentWeek: Int = 0
      for workout in workouts {
         if weeks[currentWeek].0...weeks[currentWeek].1 ~= Int(workout.sets[0].date)! {
            returnArr[currentWeek] += [workout]
         } else {
            currentWeek += 1
            returnArr[currentWeek] += [workout]
         }
      }
      
      return returnArr
      
   }
   
}






