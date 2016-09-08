//
//  EnclosingCircle.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/6/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct EnclosingCircle {
   
   // MARK: Properties
   // The layer for the animation
   let layer: CAShapeLayer = CAShapeLayer()
   // The radius for the layer
   let radius: CGFloat
   // The view that will hold the animation
   let view: UIView
   
   // MARK: Initializers
   /**
    Default and only initializer
    - parameter radius: The size of the radius to start the layer
    - parameter view: The view that will hold the animation
   */
   init(radius: CGFloat, view: UIView) {
      // Set the radius property
      self.radius = radius
      self.view = view
      // Set up the cirlce
      self.setUpLayer()
   }
   
   // MARK: Functions
   /// Creates the layer and adds it to the view
   func setUpLayer() {
      
      // Create the path for the layer
      let path: UIBezierPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: self.view.frame.height)), cornerRadius: 0)
      let cirlcePath: UIBezierPath = UIBezierPath(roundedRect: CGRect(x: self.view.frame.width / 2 - self.radius, y: self.view.frame.height / 2 - self.radius, width: self.radius * 2, height: self.radius * 2), cornerRadius: self.radius)
      path.append(cirlcePath)
      path.usesEvenOddFillRule = true
      
      // Set the path's layer property to the path just created
      self.layer.path = path.cgPath
      self.layer.fillRule = kCAFillRuleEvenOdd
      
      // Set the color and opacity of the layer
      self.layer.fillColor = UIColor.red.cgColor
      self.layer.opacity = 1.0
      
      // Add the layer to the view
      view.layer.addSublayer(self.layer)
   }
   
   /// Creates the animation for the layer
   func animate() {
      
      // Create the animtion property
      let animation: CABasicAnimation = CABasicAnimation(keyPath: "path")
      // Set the radius for the new circle
      let radius: CGFloat = 1.0
      
      // Create the path for the layer
      let path: UIBezierPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.width, height: self.view.frame.height)), cornerRadius: 0)
      let cirlcePath: UIBezierPath = UIBezierPath(roundedRect: CGRect(x: view.frame.width / 2 - radius, y: view.frame.height / 2 - radius, width: radius * 2, height: radius * 2), cornerRadius: radius)
      path.append(cirlcePath)
      
      // Set the values for the animation
      animation.fromValue = layer.path
      animation.toValue = path.cgPath
      animation.duration = 5.30
      
      // Add the animation to the layer
      layer.add(animation, forKey: "path")
      
   }
   
}
