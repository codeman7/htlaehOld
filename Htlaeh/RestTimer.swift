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
   
   mutating func startTimer(_ active: Bool, time: Double) {
      
      if active == false {
         var time = time
         let timerAction: () -> () = {
            time -= 1
            let priority = DispatchQueue.GlobalQueuePriority.default
            DispatchQueue.global(priority: priority).async {
               DispatchQueue.main.async {
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
