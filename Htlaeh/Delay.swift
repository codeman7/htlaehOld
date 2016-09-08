//
//  Delay.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/17/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
struct Delay {
   
   func delay(_ delay:Double, closure:@escaping ()->()) {
      DispatchQueue.main.asyncAfter(
         deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
   }
   
   
   /// Use this function if the closure need's to be cancelable
   func delay(_ delay: Double, closure: (()->())?) {
      
      guard let function = closure else {
         return
      }
      
      DispatchQueue.main.asyncAfter(
         deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: function)
      
   }
   
}

class CancelableTimer: NSObject {
   fileprivate var q = DispatchQueue(label: "timer",attributes: [])
   fileprivate var timer : DispatchSource!
   fileprivate var firsttime = true
   fileprivate var once : Bool
   fileprivate var handler : () -> ()
   init(once:Bool, handler:@escaping ()->()) {
      self.once = once
      self.handler = handler
      super.init()
   }
   func startWithInterval(_ interval:Double) {
      self.firsttime = true
      self.cancel()
      self.timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: self.q) /*Migrator FIXME: Use DispatchSourceTimer to avoid the cast*/ as! DispatchSource
      self.timer.setTimer(start: DispatchWallTime(time: nil),
                                interval: UInt64(interval * Double(NSEC_PER_SEC)),
                                leeway: UInt64(0.05 * Double(NSEC_PER_SEC)))
      self.timer.setEventHandler(handler: {
         if self.firsttime {
            self.firsttime = false
            return
         }
         self.handler()
         if self.once {
            self.cancel()
         }
      })
      self.timer.resume()
   }
   func cancel() {
      
      if self.timer != nil {
         timer.cancel()
      }
   }
   deinit {
      print("deinit cancelable timer")
   }
}


/**
 
 /// PROPERTIES INSIDE THE CLASS
 var timer: CancelableTimer? = nil
 var count: Int = 0
 
 /// Call creation method 
 self.recursion()
 
 /// CREATE THE TIMER AND START IT
 func recursion() {
   if timer == nil {
      let closure: () -> () = {
      self.count += 1
      self.recursion()
      }
   self.timer = CancelableTimer(once: false, handler: closure)
 
 
   self.timer?.startWithInterval(1.0)
 
 
   }
 }
 
 
 
 /// CANCEL THE TIMER
 self.timer?.cancel()
 */


