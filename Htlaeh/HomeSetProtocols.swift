//
//  HomeSetProtocols.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/// All Home Labels should conform to these protocols
protocol HomeLabelAbilities {
   /// The original point the label is at when created
   var origin: CGPoint { get }
   /// The destination for the label when it moves
   var destination: CGPoint { get }
   /// Set's the labels text to blank
   func setToBlank()
   /// Moves the label back to it's origin
   func backToOrigin()
   /// Used to reset the labels text
   func update(text text: String)
   /// Set properties for the label
   func set(properties properties: HomeLabel)
}

/// Used for Home Content / Home Hint's in the upper half
protocol MoveUp {
   /// Makes the label disappear
   func moveUp()
}

/// Used for Home Accent / Home Hints that are in the lower half
protocol Disappear {
   /// Makes the label move up to top half
   func hide()
}

extension Disappear where Self : UILabel, Self : HomeLabelAbilities {
   
   func hide() {
      
      self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05)
      self.frame.origin = self.destination
      
   }
   
}


/// Used within the animation blocks
protocol HomeLabelAnimations {
   
}

// Used for all the home labels to set their properties
extension HomeLabelAbilities where Self : UILabel {
   
   func set(properties properties: HomeLabel) {
      
      self.textAlignment = properties.alignment
      self.textColor = properties.color
      self.font = properties.font
      self.alpha = properties.alpha
      
   }
   
   func backToOrigin() {
      
      // Transform the label back to origin size and set it's origin back to original origin
      self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.frame.origin = self.origin
      
   }
   
   func setToBlank() {
      self.text = ""
   }
   
   func update(text text: String) {
      self.text = text
   }
   
}






