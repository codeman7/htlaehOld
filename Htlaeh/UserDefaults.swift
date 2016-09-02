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
   
   let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
   
   func defaultValues() {
      
      self.store(.audio, value: false)
      self.store(.timeAlert, value: true)
      self.store(.time, value: "6:00 AM")
      self.store(.numberOfDays, value: 6)
      
   }

   
   func store(key: DefaultKeys, value: Bool) {
      
      self.defaults.setBool(value, forKey: key.rawValue)
      
   }
   
   func store(key: DefaultKeys, value: Int) {
      
      self.defaults.setInteger(value, forKey: key.rawValue)
      
   }
   
   func store(key: DefaultKeys, value: String) {
      
      self.defaults.setObject(value, forKey: key.rawValue)
      
   }
   
   func queryForString(key: DefaultKeys) -> String? {
      
      let value = self.defaults.valueForKey(key.rawValue)
      
      guard let str = value as? String else {
         return nil
      }
      
      return str
      
   }
   
   func queryForBool(key: DefaultKeys) -> Bool? {
      
      return self.defaults.boolForKey(key.rawValue)
      
   }
   
   func queryForInt(key: DefaultKeys) -> Int? {
      
      return self.defaults.integerForKey(key.rawValue)
      
   }
   
}