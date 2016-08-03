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
   */
   func createSet(workoutSet: WeightSet) {
      
      self.name = workoutSet.name
      self.setCount = workoutSet.setCount
      self.reps.value = workoutSet.reps
      self.restTime.value = workoutSet.restTime
      self.weight.value = workoutSet.weight
      self.time.value = workoutSet.time
      self.date = workoutSet.date
      self.complete = workoutSet.complete
      
   }
   
}

