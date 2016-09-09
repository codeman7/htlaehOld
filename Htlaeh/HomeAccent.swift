//
//  HomeAccent.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class HomeAccent : UILabel {
   
   // MARK: Properties
   let destination: CGPoint
   let origin: CGPoint
   let location: HomeLabelLocation
   var active: Bool
   
   // MARK: Initializers
   init(frame: Rect, active: Bool, location: HomeLabelLocation, destination: CGPoint) {
      
      // Set the destination, origin, and location properties
      self.destination = destination
      self.origin = frame.origin
      self.location = location
      self.active = active
      
      // Call the super intializer
      super.init(frame: frame)
      
      // Set properties
      self.set(HomeLabel.accent)
   }
   
   convenience init(frame: Rect, active: Bool, location: HomeLabelLocation, destination: CGPoint, text: String) {
      
      // Call the super intializer
      self.init(frame: frame, active: active, location: location, destination: destination)
      
      // Set the text property for the label
      self.text = text
   }
   
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   func moveUp() {
      
      self.frame = Rect(origin: self.destination, size: self.frame.size)
      self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5)
      self.alpha = HomeLabel.content.alpha
      
   }
   
}

extension HomeAccent : HomeLabelAbilities { }
extension HomeAccent : MoveUp { }
