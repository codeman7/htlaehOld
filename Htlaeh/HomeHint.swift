//
//  HomeHint.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class HomeHint : UILabel {
   
   // MARK: Properties
   let destination: CGPoint
   let origin: CGPoint
   fileprivate let location: HomeLabelLocation
   var active: Bool
   
   init(frame: Rect, active: Bool, location: HomeLabelLocation, destination: CGPoint) {
      
      // Set the destination, origin, and location properties
      self.destination = destination
      self.origin = frame.origin
      self.location = location
      self.active = active
      
      // Call the super intializer
      super.init(frame: frame)
      
      // Set properties
      self.set(properties: HomeLabel.hint)
      self.setText()
   }

   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }

   // MARK: Functions   
   func setText() {
   
      // Set the text based on location and if active or not
      switch self.location {
      case .left:
         self.text = (self.active) ? "Reps" : ""
      case .middle:
         self.text = (self.active) ? "Exercise Name" : "Rest"
      case .right:
         self.text = (self.active) ? "Weight" : ""
      }
      
   }
   
   func moveUp() {
      
      self.frame.origin = self.destination
      
   }
   
   
}

extension HomeHint : HomeLabelAbilities {
  
   func update(text: String) {
      // Update the text to what it should be
      self.setText()
   }
   
}

extension HomeHint : Disappear { }
extension HomeHint : MoveUp { }






