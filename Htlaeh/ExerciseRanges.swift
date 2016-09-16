//
//  ExerciseRanges.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/14/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
struct ExerciseRanges {
   
   enum Mark {
      case rMin, rMax, wMin, wMax
   }
   
   let repsMinimum: Int
   let repsMaximum: Int
   let weightMinimum: Int
   let weightMaximum: Int
   
   init(rMin: Int, rMax: Int, wMin: Int, wMax: Int) {
      self.repsMinimum = rMin
      self.repsMaximum = rMax
      self.weightMinimum = wMin
      self.weightMaximum = wMax
   }
   
   func new(value: Int, forVariable variable: Mark) -> ExerciseRanges {
      switch variable {
      case .rMin:
         return ExerciseRanges(rMin: value, rMax: self.repsMaximum, wMin: self.weightMinimum, wMax: self.weightMaximum)
      case .rMax:
         return ExerciseRanges(rMin: self.repsMinimum, rMax: value, wMin: self.weightMinimum, wMax: self.weightMaximum)
      case .wMin:
         return ExerciseRanges(rMin: self.repsMinimum, rMax: self.repsMaximum, wMin: value, wMax: self.weightMaximum)
      case .wMax:
         return ExerciseRanges(rMin: self.repsMinimum, rMax: self.repsMaximum, wMin: self.weightMinimum, wMax: value)

      }
   }
   
}