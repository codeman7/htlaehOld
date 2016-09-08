//
//  Card.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/16/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit

/**
   Base class for a card just sets up a standard card
 */
class Card: UIView {
   
   // MARK: Properties
   
   // MARK: Initalizers
   /// Default Initalizers sets up all standard setup for a card
   override init(frame: CGRect) {
      
      super.init(frame: frame)
      self.layer.cornerRadius = 2.0
      self.elevate(1.0)
      self.backgroundColor = .white
      
   }
   
   /// Required by Apple **Never Use**
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /// Override to raise the card up
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      super.touchesBegan(touches, with: event)
      self.elevate(4.0)
      
   }
   
   /// Override to lower the card back to normal
   override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      super.touchesCancelled(touches, with: event)
      self.elevate(1.0)
      
   }
   
   /// Override to lower the card back to normal
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      super.touchesEnded(touches, with: event)
      self.elevate(1.0)
      
   }
   
}
