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
      let decimalCharacters = NSCharacterSet.decimalDigitCharacterSet()
      let decimalRange = self.rangeOfCharacterFromSet(decimalCharacters, options: NSStringCompareOptions(), range: nil)
      
      if decimalRange == nil {
         return false
      } else {
         return true
      }
   }
   
   func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
      let constrainedRect = CGSize(width: width, height: CGFloat.max)
      let boundingBox = self.boundingRectWithSize(constrainedRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
      return boundingBox.height
   }
   
   func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
      let constrainedRect = CGSize(width: CGFloat.max, height: height)
      let boundingBox = self.boundingRectWithSize(constrainedRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
      return boundingBox.width
   }
      
   subscript (i: Int) -> Character {
      return self[self.startIndex.advancedBy(i)]
   }
      
   subscript (i: Int) -> String {
      return String(self[i] as Character)
   }
      
   subscript (r: Range<Int>) -> String {
      let start = startIndex.advancedBy(r.startIndex)
      let end = start.advancedBy(r.endIndex - r.startIndex)
      return self[Range(start ..< end)]
   }
   
}