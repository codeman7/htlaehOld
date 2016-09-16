//
//  JSONSet.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/29/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

struct JSONSet {
   let name: String
   let weight: Double
   let reps: Int
   let restTime: Int
   private let date: Int
   private let count: Int
   private let synced: Bool
   
   init(set: WeightSet) {
      self.name = set.name
      self.weight = set._weight
      self.reps = set._reps
      self.restTime = Int(set._restTime)
      self.date = Int(set.date) ?? 0
      self.count = set.setCount
      self.synced = set.synced
   }
   
   var val: [Any] {
      return [self.name, self.reps, self.weight, self.restTime]
   }
   
   func makeSet() -> WeightSet {
      
      return WeightSet.createStandardSet(self.name, setCount: self.count, reps: self.reps, restTime: Double(self.restTime), weight: self.weight, date: "\(self.date)", synced: self.synced)
      
   }
   
}