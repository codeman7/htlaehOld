//
//  CellLayout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/19/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct CellLayout {
   let frame: Rect
   
   init(frame: Rect) {
      self.frame = frame
   }
   
   func left() -> Rect {
      
      return Rect(x: 16, y: 14, w: self.frame.w / 5 * 2 - 16, h: 21)
      
   }
   
   func right() -> Rect {
      
      return Rect(x: self.frame.w / 10 * 7, y: 14, w: self.frame.w / 10 * 3 - 16, h: 21)
      
   }
   
   func middle() -> Rect {
      
      return Rect(x: self.frame.w / 5 * 2, y: 14, w: self.frame.w / 10 * 3 - 16, h: 21)
      
   }
   
}