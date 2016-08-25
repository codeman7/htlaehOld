//
//  Dictionary.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/24/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

extension Dictionary {
   func sortByValues(isOrderedBefore:(Value, Value) -> Bool) -> [Key] {
      return Array(self)
         .sort() {
            let (_, lv) = $0
            let (_, rv) = $1
            return isOrderedBefore(lv, rv)
         }
         .map {
            let (k, _) = $0
            return k
      }
   }
}