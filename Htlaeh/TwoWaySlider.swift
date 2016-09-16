import Foundation
import UIKit

/**
   This class is a subsitiute for UISlider
 
   Allows for sliding in two directions to set a min and max
 
   - author: Cody Weaver
   
   - version: 1.0
 
 
   **Spec:**
 
   Thumb color non active - Black @ 26%
   Thumb color active - Color @ 100%
 
 
 
 */
class TwoWaySlider : UIView {
   
   // MARK: Properties
   private lazy var minThumb: Thumb = self.createThumb(true, min: true)
   private lazy var maxThumb: Thumb = self.createThumb(false, min: false)
   private lazy var activeTrack: Line = self.createActiveTrack()
   
   var absoluteMin: Int
   var absoluteMax: Int
   
   var min: Int
   var max: Int
   
   // MARK: Initializers
   
   /**
    Default initiliazer
   
    - parameter frame: The origin of the view and the width, *height* will always be 48
    - parameter values: The minimum and maximum that the view will be
   */
   init(frame: CGRect, values: (min: Int, max: Int)) {
      
      // Set the minimum and maximum values for both absolute and current
      self.absoluteMax = values.max
      print("\(values.min) & \(values.max)")
      self.max = values.max
      self.absoluteMin = values.min
      self.min = values.min
      
      // Make sure the height is 48
      let f = CGRect(origin: frame.origin, size: CGSize(width: frame.size.width, height: 48))
      
      // Call the super initializer and add the track
      super.init(frame: f)
      self.renderTrack()
      
      self.addSubview(activeTrack)
      
      // Add the thumbs
      self.addSubview(minThumb)
      self.addSubview(maxThumb)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
    Adds the track to the view
   */
   private func renderTrack() {
      
      // Create the frame for the track and the track
      let frame: CGRect = CGRect(x: 33, y: 22.5, w: self.frame.w - 66, h: 3)
      let line: Line = Line(frame: frame, alpha: 0.26)
      
      // Add the track as a subview
      self.addSubview(line)
      
   }
   
   private func createActiveTrack() -> Line {
      
      // Set the frame for the line and create the line
      let frame: CGRect = CGRect(x: 33, y: 22.5, w: self.frame.w - 66, h: 3)
      let line: Line = Line(frame: frame, color: .blue)
      
      // Return the line
      return line
      
   }
   
   private func updateActive(value: CGFloat, min: Bool) {
      
      let lineWidth: CGFloat = self.frame.w - 66
      let difference: Int = self.absoluteMax - self.absoluteMin
      let rangePerValue: Float = Float(lineWidth) / Float(difference)
      
      if min {
         self.activeTrack.frame.origin.x = value + 33
         let width = self.maxThumb.frame.origin.x - value
         self.activeTrack.frame.size.width = width
         let min = self.absoluteMin + Int(Float(value) / rangePerValue)
         self.min = (min < self.absoluteMin) ? absoluteMin : min
      } else {
         let width = value - self.minThumb.frame.origin.x
         self.activeTrack.frame.size.width = width
         let max = self.absoluteMin + Int(Float(value - 15) / rangePerValue)
         self.max = (max > self.absoluteMax) ? absoluteMax : max
      }
            
   }
   
   /**
    Creates the thumb
    
    - parameter empty: Should it be rendered as empty or not
    - parameter min: Is it the min or the max thumb
    - returns: Thumb to be set as a lazy property
   */
   private func createThumb(empty: Bool, min: Bool) -> Thumb {
      
      // Set the origin and create the thumb
      let origin: CGPoint = CGPoint(x: min ? 0 : self.frame.w - 48, y: 0)
      let thumb: Thumb = Thumb(origin: origin)
      // Set the empty property and return the thumb
      thumb.empty = empty
      return thumb
      
   }
   
}

// MARK: Interaction
extension TwoWaySlider {
   
   /// Handles touches began
   override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      super.touchesBegan(touches, withEvent: event)
      if let touch = touches.first {
         if CGRectContainsPoint(self.minThumb.frame, touch.locationInView(self)) {
            self.minThumb.active = true
         } else if CGRectContainsPoint(self.maxThumb.frame, touch.locationInView(self)) {
            self.maxThumb.active = true
         }
      }
      
   }
   
   /// Handles touches moved
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      if let location = touches.first?.locationInView(self) {
         if self.minThumb.active {
            if location.x <= 0 {
               self.minThumb.frame.origin.x = 0
               self.minThumb.empty = true
            } else if location.x + 18 > maxThumb.frame.origin.x {
               self.minThumb.frame.origin.x = self.maxThumb.frame.origin.x - 18
               self.minThumb.empty = false
            } else {
               self.minThumb.frame.origin.x = location.x
               self.minThumb.empty = false
            }
            
            self.updateActive(self.minThumb.frame.origin.x, min: true)
            
         } else if self.maxThumb.active {
            
            if location.x >= self.frame.w - 48 {
               self.maxThumb.frame.origin.x = self.frame.w - 48
            } else if location.x < minThumb.frame.origin.x + 18 {
               self.maxThumb.frame.origin.x = self.minThumb.frame.origin.x + 18
            } else {
               self.maxThumb.frame.origin.x = location.x
            }
            
            self.updateActive(self.maxThumb.frame.origin.x, min: false)
         }
      }
      
   }
   
   /// Handles touches ended
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      self.minThumb.active = false
      self.maxThumb.active = false
      
   }
   
}






