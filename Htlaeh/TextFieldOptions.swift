//
//  TextFieldOptions.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This enum is used to decide what kind of text field it is going to be
*/
enum TextFieldType {
   case All
   case Number
   case Time
}

/**
 
 */
protocol TextFieldOptions {
   /// The placeholder for the text field
   var placeHolderText: String { get }
   /// The type for the text field
   var type: TextFieldType { get }
   /// The variable for the style of the view
   var style: TextFieldStyle { get }
   
}

struct TextFieldSettings: TextFieldOptions {
   let placeHolderText: String
   let type: TextFieldType
   let style: TextFieldStyle
   init(placeHolder: String, type: TextFieldType, style: TextFieldStyle) {
      self.placeHolderText = placeHolder
      self.type = type
      self.style = style
   }
   
}