//
//  Line.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this class to create a UIView that is a just a line
 */
class Line: UIView {
   
   // MARK: Initializers
   /** Designated initializer for black lines
    - parameter frame: The frame the view will have
    - parameter alpha: The alpha for the line
   */
   init(frame: CGRect, alpha: CGFloat) {
      // Call the super initalizer
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = .black
      // Set the alpha of the view
      self.alpha = alpha
      
   }
   
   /** Designated initializer for colored lines
    - parameter frame: The frame that the view will have
    - parameter color: The color the view will be
   */
   init(frame: Rect, color: UIColor) {
      // Call the super initializer
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = color
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
}