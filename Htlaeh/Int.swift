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
      return "\(Date().monthNameFor(month: month))" + " \(self % 100)"
      
   }
   
}