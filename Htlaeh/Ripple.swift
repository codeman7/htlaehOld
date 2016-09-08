//
//  ButtonRipple.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This protocol is used for mostly for "Buttons"
   It shows the "Ripple" effect when a button is touched
 */
protocol Ripple {
   /// This function is called
   func ripple(_ rippleColor: UIColor)
}

extension Button : Ripple {
   
   func ripple(_ rippleColor: UIColor) {
      
      let shape: CAShapeLayer = self.getShape(rippleColor)
      self.layer.addSublayer(shape)
      animate(shape)
      
   }
   
}

extension Ripple where Self : UIView {
   
   func ripple(_ rippleColor: UIColor) {
      
      let shape: CAShapeLayer = self.getShape(rippleColor)
      self.layer.addSublayer(shape)
      animate(shape)
      
   }
   
   func getShape(_ rippleColor: UIColor) -> CAShapeLayer {
      // Create the shape
      let shape: CAShapeLayer = CAShapeLayer()
      // Create the path of the shape
      let path: CGPath = UIBezierPath(roundedRect: CGRect(x: self.frame.width / 2 - 1, y: self.frame.height / 2 - 1, width: 2, height: 2), cornerRadius: 1).cgPath
      // Assign the path to the shapes path
      shape.path = path
      // Set the color of the shape
      shape.fillColor = rippleColor.cgColor
      // Set the opacity of the shape
      shape.opacity = 0.74
      // Return the shape
      return shape
      
   }
   
   func animate(_ shape: CAShapeLayer) {
      
      // Create the path that will end up the final path
      let finalPath: CGPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), cornerRadius: self.frame.width / 2).cgPath
      // Create the animation
      let animation: CABasicAnimation = CABasicAnimation(keyPath: "path")
      // Set the animations from value
      animation.fromValue = shape.path
      // Set the animations to value
      animation.toValue = finalPath
      // Set the duration of the animations
      animation.duration = 0.3
      // Set the fill mode for the animation
      animation.fillMode = kCAFillModeBoth
      // Set the timing function for the animation
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      // Add the animation to the shape
      shape.add(animation, forKey: animation.keyPath)
      
   }
   
}
