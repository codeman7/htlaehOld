//
//  KeychainNotifications.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/1/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

enum DefaultKeys : String {
   
   case numberOfDays
   case audio
   case time
   case timeAlert
   
}

struct UserDefaults {
   
   let defaults: Foundation.UserDefaults = Foundation.UserDefaults.standard
   
   func defaultValues() {
      
      self.store(.audio, value: false)
      self.store(.timeAlert, value: true)
      self.store(.time, value: "6:00 AM")
      self.store(.numberOfDays, value: 6)
      
   }

   
   func store(_ key: DefaultKeys, value: Bool) {
      
      self.defaults.set(value, forKey: key.rawValue)
      
   }
   
   func store(_ key: DefaultKeys, value: Int) {
      
      self.defaults.set(value, forKey: key.rawValue)
      
   }
   
   func store(_ key: DefaultKeys, value: String) {
      
      self.defaults.set(value, forKey: key.rawValue)
      
   }
   
   func queryForString(_ key: DefaultKeys) -> String? {
      
      let value = self.defaults.value(forKey: key.rawValue)
      
      guard let str = value as? String else {
         return nil
      }
      
      return str
      
   }
   
   func queryForBool(_ key: DefaultKeys) -> Bool? {
      
      return self.defaults.bool(forKey: key.rawValue)
      
   }
   
   func queryForInt(_ key: DefaultKeys) -> Int? {
      
      return self.defaults.integer(forKey: key.rawValue)
      
   }
   
}
