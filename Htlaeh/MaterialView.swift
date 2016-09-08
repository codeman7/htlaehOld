//
//  MaterialView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol MaterialView {
   
   func elevate(_ elevation: Double)
   
}

extension UIView: MaterialView {
   
   func elevate(_ elevation: Double) {
      
      self.layer.masksToBounds = false
      self.layer.shadowColor = UIColor.black.cgColor
      self.layer.shadowOffset = CGSize(width: 0, height: elevation)
      self.layer.shadowRadius = abs(CGFloat(elevation))
      self.layer.shadowOpacity = 0.24
      
   }
   
}
