//
//  Bool Extension.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/29/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation


extension Bool {
   
   mutating func change() {
      if self == true {
         self = false
      } else {
         self = true
      }
   }
   
}

extension String {
   
   /**
   Convert a string to a bool
   Anything other than true/false returns nil
   */
   func bool() -> Bool? {
      
      switch self.lowercased() {
      case "true":
         return true
      case "false":
         return false
      default:
         return nil
      }
      
   }
   
}
