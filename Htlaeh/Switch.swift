//
//  Switch.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/1/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
 This class is used for a switch which is always 36w x 20h
 */
class SwitchView : UIView {
   
   // MARK: Properties
   
   /// Property for the current value
   var value: Bool
   /// Color the view will be when switched on
   let color: UIColor
   /// Property for the thumb
   private lazy var thumb: UIView = self.createThumb()
   /// Property for the track
   private lazy var track: UIView = self.createTrack()
   /// Property for the action if a switch is touched
   var action: () -> () = { fatalError("Please set the action for the switch") }
   
   // MARK: Initializers
   
   /**
    Default initializer
    - parameter origin: The origin of the view
    - parameter value: The value for the view
    - parameter color: The color that the view will be when switch on
   */
   init(origin: CGPoint, value: Bool, color: UIColor) {
      
      // Set the properties
      self.value = value
      self.color = color
      // Call the super initializer
      super.init(frame: Rect(origin: origin, size: CGSize(width: 36, height: 20)))
      
      // Layout the views
      self.viewSetup()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   
   /// Sets up all the views
   private func viewSetup() {
      
      // Add the track to the view
      self.addSubview(self.track)
      
      // Add the thumb to the view
      self.addSubview(self.thumb)
      
   }
   
   /// Handles a touch, updates the value and views
   private func change() {
      
      // Update the value
      self.value.change()
      
      // Update the thumb
      self.updateThumb()
      
      // Update the track
      self.updateTrack()
      
   }
   
   /// Updates the track after a touch
   private func updateTrack() {
      
      // Get the new color
      let color: UIColor = (self.value == true) ? self.color.colorWithAlphaComponent(0.5) : UIColor.black.colorWithAlphaComponent(0.38)
      
      // Animate the track
      UIView.animateWithDuration( 0.15, animations: {
         self.track.backgroundColor = color
      })
      
   }
   
   
   /// Updates the thumb after a touch
   private func updateThumb() {
      
      // Update the color
      let color: UIColor = (self.value == true) ? self.color : .grey50
      
      // Update the frame
      let x: CGFloat = (self.value == true) ? 22 : 0
      
      // Animate the view
      UIView.animateWithDuration( 0.15, animations: {
         self.thumb.backgroundColor = color
         self.thumb.frame.origin.x = x
      })
      
   }
   
}


extension SwitchView {
   
   /// Creates the thumb
   private func createThumb() -> UIView {
      
      // Create the frame
      let origin: CGPoint = (self.value == true) ?  CGPoint(x: 22, y: 0)  : CGPoint(x: 0, y: 0)
      let frame: Rect = Rect(origin: origin, size: CGSize(width: 20, height: 20))
      
      // Create the view and set its color
      let view: UIView = UIView(frame: frame)
      view.backgroundColor = (self.value == true) ? self.color : .grey50
      
      // Elevate the view and round the corners
      view.elevate(1.0)
      view.layer.cornerRadius = 10.0
      
      // Return the view
      return view
      
   }
   
   /// Creates the track
   private func createTrack() -> UIView {
      
      // Create the frame for the track and the track itself
      let frame: CGRect = CGRect(x: 6, y: 2.5, width: 30, height: 15)
      let view: UIView = UIView(frame: frame)
      
      // Set the color of the track and it's corner radius
      view.backgroundColor = (self.value == true) ? self.color.colorWithAlphaComponent(0.5) : UIColor.black.colorWithAlphaComponent(0.38)
      view.layer.cornerRadius = 7.5
      
      // Return the track
      return view
      
   }
   
}

// MARK: Extension to handle touches
extension SwitchView {
   
   /// Updates the view when touched
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      super.touchesEnded(touches, withEvent: event)
      self.change()
      self.action()
   }
   
}






