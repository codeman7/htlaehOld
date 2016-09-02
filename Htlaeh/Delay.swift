//
//  Delay.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/17/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
struct Delay {
   
   func delay(delay:Double, closure:()->()) {
      dispatch_after(
         dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
         ),
         dispatch_get_main_queue(), closure)
   }
   
   
   /// Use this function if the closure need's to be cancelable
   func delay(delay: Double, closure: (()->())?) {
      
      guard let function = closure else {
         return
      }
      
      dispatch_after(
         dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
         ),
         dispatch_get_main_queue(), function)
      
   }
   
}

class CancelableTimer: NSObject {
   private var q = dispatch_queue_create("timer",nil)
   private var timer : dispatch_source_t!
   private var firsttime = true
   private var once : Bool
   private var handler : () -> ()
   init(once:Bool, handler:()->()) {
      self.once = once
      self.handler = handler
      super.init()
   }
   func startWithInterval(interval:Double) {
      self.firsttime = true
      self.cancel()
      self.timer = dispatch_source_create(
         DISPATCH_SOURCE_TYPE_TIMER,
         0, 0, self.q)
      dispatch_source_set_timer(self.timer,
                                dispatch_walltime(nil, 0),
                                UInt64(interval * Double(NSEC_PER_SEC)),
                                UInt64(0.05 * Double(NSEC_PER_SEC)))
      dispatch_source_set_event_handler(self.timer, {
         if self.firsttime {
            self.firsttime = false
            return
         }
         self.handler()
         if self.once {
            self.cancel()
         }
      })
      dispatch_resume(self.timer)
   }
   func cancel() {
      
      if self.timer != nil {
         dispatch_source_cancel(timer)
      }
   }
   deinit {
      print("deinit cancelable timer")
   }
}


