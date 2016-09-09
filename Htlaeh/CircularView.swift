//
//  CircularView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/14/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class CircularView : UIView {
   // MARK: Properties
   // MARK: Initializers
   init(point: CGPoint, color: UIColor) {
      
      // Call the super initiliazer
      super.init(frame: Rect(x: point.x, y: point.y, w: 2, h: 2))
      // Set the background color for the view
      self.backgroundColor = color
      // Set the corner radius to half the height and width
      self.layer.cornerRadius = 1
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /// This function makes the view grow to cover the screen
   func grow() {
      UIView.animateWithDuration(0.25, animations: {
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 750.0, 750.0)
      })
   }
   
   func grow(completion: ()->()) {
      UIView.animateWithDuration(0.25, animations: {
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 750.0, 750.0)
         }, completion: { Bool in completion() })
      
   }
}
