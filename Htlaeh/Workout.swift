//
//  Workout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

/**
 Protocol for a whole workout
 */
protocol WorkoutType {
   
   /// Array of all the Sets/Exercises
   var sets: [WeightSet] { get }
   /// Array of Sets/Exercises that are done
   //var completedSets: [WeightSet] { get }
   /// Array of Sets/Exercises that aren't complete
   //var remainingSets: [WeightSet] { get }
   /// Variable to get the workout count
   var count: Int { get }
   /// Add a set to the workout
   func add(_ set: WeightSet) -> Self
   /// Remove a set
   //func removeSetFromWorkout(newSet: WeightSet) -> Self
   /// Mark a whole workout as complete, maybe entered after already done
   func markAsComplete() -> Self
   /// Change the date of the workout
   func updateDate(_ newDate: String) -> Self
   
}

extension WorkoutType {
   
   var count: Int {
      return sets.count
   }
   
}

/**
 Use this struct to create an full Workout
 */

struct Workout: WorkoutType {
   // MARK: Properties
   var sets: [WeightSet]
   /// The variable for the date of the workout
   var date: Int {
      guard self.sets.isEmpty == false else { return 0 }
      return Int(self.sets.first!.date)!
   }
   var completedSets: [WeightSet] {
      return self.determineCompletedSets()
   }
   var remainingSets: [WeightSet] {
      return self.determineRemainingSets()
   }
   
   subscript(i: Int) -> WeightSet {
      get {
        return self.sets[i]
      }
      
      set {
         self.sets[i] = newValue
      }
   }
   
   subscript(i: Range<Int>) -> Workout {
      var workout = Workout()
      for iteration in i {
         workout = workout.add(self[iteration])
      }
      return workout
   }
   
   // MARK: Initializers
   /// Default initalizers
   init(firstSet: WeightSet) {
      
      self.sets = [firstSet]
      
   }
   
   init() {
      
      self.sets = []
      
   }
   
   init(sets: [WeightSet]) {
      
      self.sets = sets
      
   }
   
   // MARK: Functions to conform to protocol
   func add(_ set: WeightSet) -> Workout {
      
      var tempArray: [WeightSet] = self.sets
      tempArray += [set]
      return Workout(sets: tempArray)
      
   }
   
   func update(at index: Int, newSet: WeightSet) -> Workout {
      
      var tempWorkout = self
      tempWorkout[index] = newSet
      return tempWorkout
      
   }
   
   func updated(at index: Int, newSet: WeightSet) -> Workout {
      
      var sets: [WeightSet] = []
      for i in 0..<self.count {
         if i == index {
            sets += [newSet]
         } else {
            sets += [self[index]]
         }
      }
      
      return Workout(sets: sets)
      
   }
   
   /*func removeSetFromWorkout(newSet: WeightSet) -> Workout {
      
      
      
   }*/
   
   func markAsComplete() -> Workout {
      
      var tempSetsArray: [WeightSet] = self.sets
      // 'a' is index of array
      for a in 0..<self.count {
         
         var tempSet = self[a]
         tempSet = tempSet.setDone()
         tempSetsArray[a] = tempSet
         
      }
      return Workout(sets: tempSetsArray)
      
   }
   
   func updateDate(_ newDate: String) -> Workout {
      
      var tempSetsArray: [WeightSet] = self.sets
      // 'a' is index of array
      for a in 0..<self.count {
         
         var tempSet = self[a]
         tempSet = tempSet.changeDate(newDate)
         tempSetsArray[a] = tempSet
         
      }
      return Workout(sets: tempSetsArray)
      
   }
   
   // MARK: Functions
   /// Determines what sets are complete and what ones aren't, used to set completed sets property
   func determineCompletedSets() -> [WeightSet] {
      
      var completedSets: [WeightSet] = []
      for set in self.sets {
         
         if set.complete == true { completedSets += [set] }
         
      }
      
      return completedSets
      
   }
   
   func determineRemainingSets() -> [WeightSet] {
      
      var remainingSets: [WeightSet] = []
      for set in self.sets {
         
         if set.complete == false { remainingSets += [set] }
         
      }
      
      return remainingSets
      
   }
   
   func updateSetCount(to setCount: Int) -> Workout {
      var workout = self
      var currentSet = setCount
      for iteration in 0..<self.count {
         var set = self[iteration]
         set = set.updateSetCount(to: currentSet)
         workout = workout.update(at: iteration, newSet: set)
         currentSet += 1
         
      }
      
      return workout
   }
   
}

// MARK: Computed properties for workout
extension Workout {
   // Returns the total weight moved throughout the workout
   var totalWeight: Double {
      return self.sets.reduce(0, { $0.0 + (Double($0.1._reps) * $0.1._weight) })
   }
   
   // Returns the total number of reps in the workout
   var totalReps: Int {
      return self.sets.reduce(0, { $0.0 + $0.1._reps })
   }
   
   // Returns the average weight used for the workout
   var averageWeight: Double {
      return self.totalWeight / Double(self.totalReps)
   }
   
   // Returns the average reps for the workout
   var averageReps: Double {
      return Double(self.totalReps) / Double(self.count)
   }
   
   /// Used to get the most common workout in an exercise
   func mostCommonExercise() -> String {
      
      // Make sure workout isn't empty
      guard self.sets.isEmpty == false else {
         return "No Sets"
      }
      
      // Put all the exercise names into an array
      let names: [String] = self.sets.map({ $0.name })
      
      // Put the names into an dictionary with of name and how often they appeared
      let mostCommon = names.frequency()
      // Sort the dictionary so the most common names are first
      let sorted = mostCommon.sortByValues(>)
      
      // Get the first and second most common names
      let first = mostCommon[sorted[0]]
      
      // Make sure there isn't just one name
      guard mostCommon.count > 1 else {
         return sorted[0]
      }
      
      let second = mostCommon[sorted[1]]
      
      // If the first and second names have the same frequency then return "Multiple" else return the most common
      if first == second {
         return "Multiple"
      } else {
         return sorted[0]
      }
      
   }
   
}

// MARK: Overload operators
func += (lhs: inout Workout, rhs: WeightSet) -> Workout {
   
   lhs = lhs.add(rhs)
   return lhs
   
}

func -= (lhs: inout Workout, rhs: Int) -> Workout {
   // Assign the workout to a temp workout
   let temp: Workout = lhs
   // Set the workout to empty
   lhs = Workout()
   // Iterate over the entire workout
   for iteration in 0..<temp.count {
      // If the iteration equals the set to skip then skip it
      if iteration == rhs {
         continue
      } else {
         // Else add it to the workout
         lhs = lhs.add(temp[iteration])
      }
   }
   // Return the new workout
   return lhs
   
}




