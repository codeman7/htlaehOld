//
//  Ne.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/28/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used for set's that are next in the queue but not active yet
 */
class NextSetView : UIView {
   
   // MARK: Properties
   let set: WorkoutSet
   
   // MARK: Initializers
   init<A: WorkoutSet>(frame: Rect, set: A) {
      
      self.set = set
      // Call the super initializer
      super.init(frame: frame)
      // Add the labels
      self.createLabels()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Funtions
   private func createLabels() {
      
      // Create the hint label for the first element
      
   }
   
}