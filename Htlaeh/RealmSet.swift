//
//  RealmWorkout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/3/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorkout: Object {
   
   dynamic var name: String = ""
   dynamic var setCount: Int = 0
   let reps = RealmOptional<Int>()
   let restTime = RealmOptional<Double>()
   let weight = RealmOptional<Double>()
   let time = RealmOptional<Double>()
   dynamic var date: String = ""
   dynamic var complete: Bool = false
   dynamic var synced: Bool = false
   
   /**
      Use as default initalizer
      - parameter workoutSet: Should be the weight set that corresponds with the set being created
      - returns: The RealmWorkout that will be stored
   */
   func createSet(workoutSet: WeightSet) -> RealmWorkout {
      let workSet: RealmWorkout = RealmWorkout()
      workSet.name = workoutSet.name
      workSet.setCount = workoutSet.setCount
      workSet.reps.value = workoutSet.reps
      workSet.restTime.value = workoutSet.restTime
      workSet.weight.value = workoutSet.weight
      workSet.time.value = workoutSet.time
      workSet.date = workoutSet.date
      workSet.complete = workoutSet.complete
      return workSet
      
   }
   
}

