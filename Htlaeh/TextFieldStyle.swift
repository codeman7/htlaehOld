//
//  TextFieldStyle.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/9/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct TextFieldStyle {
   /// The alignment for the text field
   let alignment: NSTextAlignment
   // The keyboard type for the keyboard
   let keyboardType: UIKeyboardType
   // The auto correction style for the keyboard should be nil for number pad
   let autoCorrection: UITextAutocorrectionType?
   // The return key for text field should be nil for number pad
   let returnKey: UIReturnKeyType?
   
   init(align: NSTextAlignment, keyboard: UIKeyboardType, autoCorrect: UITextAutocorrectionType?, returnKey: UIReturnKeyType?) {
      self.alignment = align
      self.keyboardType = keyboard
      self.autoCorrection = autoCorrect
      self.returnKey = returnKey
   }
}

extension TextFieldStyle {
   
   static var numbers: TextFieldStyle {
      return TextFieldStyle(align: .Right, keyboard: .NumberPad, autoCorrect: nil, returnKey: nil)
   }
   
   static var all: TextFieldStyle {
      return TextFieldStyle(align: .Left, keyboard: .Default, autoCorrect: .No, returnKey: .Next)
   }
   
   static var time: TextFieldStyle {
      return TextFieldStyle(align: .Right, keyboard: .NumberPad, autoCorrect: nil, returnKey: nil)
   }
   
}
