//
//  CurvePathAnimation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

// Methods to move view's along bezier path
extension UIView {
   
   func moveUpLeftTo(endPoint point: CGPoint) {
      
      // Create the animation and the path
      let key = CAKeyframeAnimation(keyPath: "position")
      let mutable = CGPathCreateMutable()
      
      // Update the path to be
      CGPathMoveToPoint(mutable, nil, self.center.x, self.center.y)
      CGPathAddQuadCurveToPoint(mutable, nil, point.x + 16, self.center.y - 16, point.x, point.y)
      
      // Set the path to the animation path
      key.path = mutable
      
      // Set the duration and fill mode
      key.duration = 0.225
      key.fillMode = kCAFillModeForwards
      
      // Make sure view stays where it was animated to
      key.removedOnCompletion = false
      
      // Add animation to view
      self.layer.addAnimation(key, forKey: "animation")
      self.center = point
      
   }
   
   func moveDownRightTo(endPoint point: CGPoint) {
      
      // Create the animation and the path
      let key = CAKeyframeAnimation(keyPath: "position")
      let mutable = CGPathCreateMutable()
      
      // Update the path to be
      CGPathMoveToPoint(mutable, nil, self.center.x, self.center.y)
      CGPathAddQuadCurveToPoint(mutable, nil, self.center.x + 16, point.y - 16, point.x, point.y)
      
      // Set the path to the animation path
      key.path = mutable
      
      // Set the duration and fill mode
      key.duration = 0.225
      key.fillMode = kCAFillModeForwards
      
      // Make sure view stays where it was animated to
      key.removedOnCompletion = false
      
      // Add animation to view
      self.layer.addAnimation(key, forKey: "animation")
      self.center = point
      
   }
   
}
