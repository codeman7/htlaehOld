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
   
}