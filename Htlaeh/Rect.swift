//
//  Rect.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

typealias Rect = CGRect

extension Rect {
   var w: CGFloat {
      return CGFloat(self.width)
   }
   
   var h: CGFloat {
      return CGFloat(self.height)
   }
   
   init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
      self.init(x: x, y: y, width: w, height: h)
   }
}