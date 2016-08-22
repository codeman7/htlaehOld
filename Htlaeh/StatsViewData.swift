//
//  StatsViewData.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/18/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

/**
   This protocol is for the stats view to know what information to show
*/
protocol StatsViewData {
   /// The heighest weight a user has done for a given exercise
   var personalBest: Int { get }
   /// The total amount of weight a user has moved for a given exercise
   var totalWeight: Int { get }
   /// The total reps a user has completed for a given exercise
   var totalReps: Int { get }
   /// The total sets a user has completed for a given exercise
   var totalSets: Int { get }
}

struct StatViewData : StatsViewData {
   
   let personalBest: Int
   let totalReps: Int
   let totalSets: Int
   let totalWeight: Int
   
   init(best: Int, reps: Int, sets: Int, weight: Int) {
      self.personalBest = best
      self.totalReps = reps
      self.totalSets = sets
      self.totalWeight = weight
   }
   
}