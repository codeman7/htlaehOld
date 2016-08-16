//
//  DatabaseDate.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/15/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

struct DatabaseDate {
   let year: Int
   let month: Int
   let day: Int
   
   init(year: Int, month: Int, day: Int) {
      self.year = year
      self.month = month
      self.day = day
   }
   
   func toDBFormat() -> String {
      
      // Create the month string
      let monthString: String = (self.month > 9) ? "\(self.month)" : "0\(self.month)"
      // Create the day string
      let dayString: String = (self.day > 9) ? "\(self.day)" : "0\(self.day)"
      // Return the formatted string
      return "\(self.year)\(monthString)\(dayString)"
      
   }
}