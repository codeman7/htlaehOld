//
//  FABAnimation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/16/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class FABAnimation : UIView {
   // MARK: Properties
   let circleLayer: CAShapeLayer!

   // MARK: Initializers
   /**
     Default initializer
     - parameter frame: Should be the frame for the FAB + 4 for width and height
   */
   override init(frame: CGRect) {
      self.circleLayer = CAShapeLayer()
      super.init(frame: frame)
      self.backgroundColor = UIColor.clear
      
      // Use UIBezierPath as an easy way to create the CGPath for the layer.
      // The path should be the entire circle.
      let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(M_PI * -0.5), endAngle: CGFloat(M_PI * 1.5), clockwise: true)
      
      // Setup the CAShapeLayer with the path, colors, and line width
      self.circleLayer.path = circlePath.cgPath
      self.circleLayer.fillColor = UIColor.clear.cgColor
      self.circleLayer.strokeColor = UIColor.blue.cgColor
      self.circleLayer.lineWidth = 2.0;
      
      // Don't draw the circle initially
      self.circleLayer.strokeEnd = 0.0
      
      // Add the circleLayer to the view's layer's sublayers
      layer.addSublayer(self.circleLayer)
      
   }
   
   required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: Functions
   func animateCircle(_ duration: TimeInterval) {
      // We want to animate the strokeEnd property of the circleLayer
      let animation = CABasicAnimation(keyPath: "strokeEnd")
      
      // Set the animation duration appropriately
      animation.duration = duration
      
      // Animate from 0 (no circle) to 1 (full circle)
      animation.fromValue = 0
      animation.toValue = 1
      
      // Do a linear animation (i.e. the speed of the animation stays the same)
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
      
      // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
      // right value when the animation ends.
      self.circleLayer.strokeEnd = 1.0
      
      // Do the actual animation
      self.circleLayer.add(animation, forKey: "animateCircle")
   }
   
}






