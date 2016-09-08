//
//  Time.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation


typealias Time = Double

extension Time {
   
   var minutes: Int {
      let selfMinusHours = Int(self) - (self.hours * 3600)
      return selfMinusHours / 60
   }
   
   var seconds: Int {
      return Int(self) % 60
   }
   
   var hours: Int {
      return Int(self) / 3600
   }
   
   /**
      Use this function if we know for sure the number is the amount of seconds
    
      Where we know ever 60 it resets
   */
   func toString() -> String {
      
      if self < 3600 {
         return "\(self.minutesAsString()):\(self.secondsAsString())"
      } else {
         return "\(self.hours):\(self.minutesAsString()):\(self.secondsAsString())"
      }
      
   }
   
   /**
     Use this function if we can get any number possible
    
      Where we don't know if it resets every 60 or not so most likely resets every 100
   */
   func convertToTime() -> String {
      
      guard self != 0.0 else {
         return "0:00"
      }
      let hours: Int = Int(self) / 10000
      let minute: Int = (Int(self) - (hours * 10000)) / 100
      let second: Int = Int(self) % 100
      if hours <= 0 {
         if second <= 9 {
            return "\(minute):0\(second)"
         } else {
            return "\(minute):\(second)"
         }
      } else {
         return "\(hours):\(minute):\(second)"
      }
   }
   
   func secondsAsString() -> String {
      
      return (self.seconds < 10) ? "0\(self.seconds)" : "\(self.seconds)"
      
   }
   
   func minutesAsString() -> String {
      
      if self.minutes < 10 && self.hours > 1 {
         return "0\(self.minutes)"
      } else {
         return "\(self.minutes)"
      }
      
   }
   
   /**
      This function converts a time in 100 format to a time in 60 second format
   */
   func toSeconds() -> Double {
      
      var h: Int = Int(self) / 10000
      var m: Int = Int(self) / 100 - (h * 100)
      var s = self.truncatingRemainder(dividingBy: 100)
      if s >= 60 {
         m += 1
         s = s.truncatingRemainder(dividingBy: 60)
      }
      if m >= 60 {
         h += 1
         m = m % 60
      }
      let total = Double(h) + Double(m) + Double(s)
      return total
      
   }
   
}

extension String {
   
   func timeToSeconds() -> Double {
      
      let result = String(self.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
      guard let time = Double(result) else {
         return 0.0
      }
      var h: Int = Int(time) / 10000
      var m: Int = Int(time) / 100 - (h * 100)
      var s = time.truncatingRemainder(dividingBy: 100)
      if s >= 60 {
         m += 1
         s = s.truncatingRemainder(dividingBy: 60)
      }
      if m >= 60 {
         h += 1
         m = m % 60
      }
      return Double(h) * 3600 + Double(m) * 60 + Double(s)
   }
   
   func time() -> Double? {
      let result = String(self.characters.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
      guard let time = Double(result) else {
         return nil
      }
      var h: Int = Int(time) / 10000
      var m: Int = Int(time) / 100 - (h * 100)
      var s = time.truncatingRemainder(dividingBy: 100)
      if s >= 60 {
         m += 1
         s = s.truncatingRemainder(dividingBy: 60)
      }
      if m >= 60 {
         h += 1
         m = m % 60
      }
      return Double(h) * 3600 + Double(m) * 60 + Double(s)
   }
   
}

