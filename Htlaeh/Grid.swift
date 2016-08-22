//
//  Grid.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/18/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct Grid {
   let size: CGSize
   let xPadding: CGFloat
   let yPadding: CGFloat
   
   
   init(size: CGSize, xPadding: CGFloat, yPadding: CGFloat) {
      self.xPadding = xPadding
      self.yPadding = yPadding
      self.size = size
   }
   
   func topLeft() -> Rect {
      return Rect(x: self.xPadding, y: self.yPadding, w: self.size.width / 2 - xPadding, h: self.size.height / 2 - yPadding)
   }
   
   func topRight() -> Rect {
      return Rect(x: self.size.width / 2, y: self.yPadding, w: self.size.width / 2 - xPadding, h: self.size.height / 2 - yPadding)
   }
   
   func bottomLeft() -> Rect {
      return Rect(x: self.xPadding, y: self.size.height / 2 + self.yPadding, w: self.size.width / 2 - xPadding, h: self.size.height / 2 - yPadding)
   }
   
   func bottomRight() -> Rect {
      return Rect(x: self.size.width / 2, y: self.size.height / 2 + self.yPadding, w: self.size.width / 2 - xPadding, h: self.size.height / 2 - yPadding)
   }
   
}