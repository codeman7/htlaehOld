//
//  String.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension String {
   func containsNumbers() -> Bool {
      let decimalCharacters = CharacterSet.decimalDigits
      let decimalRange = self.rangeOfCharacter(from: decimalCharacters, options: NSString.CompareOptions(), range: nil)
      
      if decimalRange == nil {
         return false
      } else {
         return true
      }
   }
   
   func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
      let constrainedRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
      let boundingBox = self.boundingRect(with: constrainedRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
      return boundingBox.height
   }
   
   func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
      let constrainedRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
      let boundingBox = self.boundingRect(with: constrainedRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
      return boundingBox.width
   }
   
}
