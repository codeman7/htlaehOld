//
//  Int.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/22/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
extension Int {
   
   func toDatePresentable() -> String {
      
      return Date().databaseDateToReadable("\(self)")
      
   }
   
   
   func toWeekPresentable() -> String {
      
      let month: Int = (self - ((self / 10000) * 10000)) / 100
      return "\(Date().nameOf(month))" + " \(self % 100)"
      
   }
   
   /// Returns the day for an Int that is in database form for date
   var day: Int {
      return self % 100
   }
   
   /// Returns the month for an Int that is in database form for a date
   var month: Int {
      return (self - (self.year * 10000)) / 100
   }
   
   /// Returns the year for an Int that is in database form for a date
   var year: Int {
      return self / 10000
   }
   
}