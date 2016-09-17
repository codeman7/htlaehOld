//
//  Icon.swift
//  Htlaeh
//
//  Created by Cody Weaver on 12/1/15.
//  Copyright © 2015 Htlaeh. All rights reserved.
//

import UIKit

class Icon: UIImageView {
   var color: UIColor {
      
      didSet(newColor) {
         
         self.colorImage(newColor)
         
      }
      
   }
   
   init(frame: CGRect, image: UIImage?, color: UIColor) {
      self.color = color
      super.init(frame: frame)
      self.image = image!
      self.colorImage(color)

   }
   
   convenience init(frame: CGRect, image: UIImage?, alpha: CGFloat) {
      
      // Call the designated initializer
      self.init(frame: frame, image: image, color: .black)
      // Set the alpha for the iamge
      self.alpha = alpha
      
   }
   
   init(frame: CGRect) {
      super.init(frame: frame)
   }

   required init?(coder aDecoder: NSCoder) {
   
      fatalError("init(coder:) has not been implemented")
    
   }
    
   func colorImage(color: UIColor) {
   
      self.image = self.image?.imageWithRenderingMode(.AlwaysTemplate)
      self.tintColor = color
    
   }
}
