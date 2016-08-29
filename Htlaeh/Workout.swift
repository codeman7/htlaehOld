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
   func add(set: WeightSet) -> Self
   /// Remove a set
   //func removeSetFromWorkout(newSet: WeightSet) -> Self
   /// Mark a whole workout as complete, maybe entered after already done
   func markAsComplete() -> Self
   /// Change the date of the workout
   func updateDate(newDate: String) -> Self
   
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
   func add(set: WeightSet) -> Workout {
      
      var tempArray: [WeightSet] = self.sets
      tempArray += [set]
      return Workout(sets: tempArray)
      
   }
   
   func update(at index: Int, newSet: WeightSet) -> Workout {
      
      var tempWorkout = self
      tempWorkout[index] = newSet
      return tempWorkout
      
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
   
   func updateDate(newDate: String) -> Workout {
      
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

// MARK: Overload operators
func += (inout lhs: Workout, rhs: WeightSet) -> Workout {
   
   lhs = lhs.add(rhs)
   return lhs
   
}

func -= (inout lhs: Workout, rhs: Int) -> Workout {
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




