//
//  SimpleDialog.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/2/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


class SimpleDialog : UIView {
   
   // MARK: Properties
   
   // MARK: Initializers
   init(origin: CGPoint) {
      
      // Call the super initializer
      super.init(frame: CGRect(origin: origin, size: CGSize.zero))
      // Elevate the view
      self.elevate(4)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
    The function to show the view
    - parameter size: The size the menu will be when shown
    - parameter direction: The direction the view will expand either Left/Right
   */
   func show(size: CGSize, direction: Direction) {
      
      
      
   }
   
   /// Hides the view from visablity
   func hide() {
      
      
   }
   
}






