//
//  RestTimer.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct RestTimer {
   
   let label: UILabel
   var timer: CancelableTimer? = nil
   
   init(label: UILabel) {
      self.label = label
      self.timer = nil
   }
   
   mutating func startTimer(active: Bool, time: Double) {
      
      if active == false {
         var time = time
         let timerAction: () -> () = {
            time -= 1
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
               // do some task
               dispatch_async(dispatch_get_main_queue()) {
                  // update some UI
                  self.label.text = time.toString()
               }
            }
         }
         // Create cancel timer
         self.timer = CancelableTimer(once: false, handler: timerAction)
         self.timer?.startWithInterval(1.0)
      } else {
         // Stop the timer and set it to nil
         self.timer?.cancel()
         self.timer = nil
      }
      
   }
   
   
}
