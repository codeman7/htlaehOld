//
//  JSONSet.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/29/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation



struct JSONSet {
   
   var set: [String : String]
   
   
   
   init(set: WeightSet) {
      
      self.set = [:]
      self.set["Exercise Name"] = set.name
      self.set["setCount"] = "\(set.setCount)"
      self.set["Reps"] = "\(set.reps)"
      self.set["Rest"] = "\(set.restTime)"
      self.set["Weight"] = "\(set.weight)"
      self.set["Time"] = "\(set.time)"
      self.set["Complete"] = "\(set.complete)"
      
   }
   
}