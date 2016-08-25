//
//  TextFieldState.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/9/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this struct to update the text field on different states
 */
struct TextFieldState {
   /// The font for the placeholder
   let placeholderFont: UIFont
   /// The y position for the placeholder
   let placeholderY: CGFloat
   /// The color for the placeholder
   let placeholderColor: UIColor
   /// The alpha for the placeholder
   let placeholderAlpha: CGFloat
   /// The color for the bottom line
   let bottomLineColor: UIColor
   /// The alpha for the bottom line
   let bottomLineAlpha: CGFloat
   /// The alpha for the error label
   let errorAlpha: CGFloat
   
   /**
    Default and only initalizer
   */
   init(placeholderFont: UIFont, placeholderY: CGFloat, placeholderColor: UIColor, placeholderAlpha: CGFloat, bottomLineColor: UIColor, bottomLineAlpha: CGFloat, errorAlpha: CGFloat) {
      
      // Set all the default properties
      self.placeholderFont = placeholderFont
      self.placeholderY = placeholderY
      self.placeholderColor = placeholderColor
      self.placeholderAlpha = placeholderAlpha
      self.bottomLineColor = bottomLineColor
      self.bottomLineAlpha = bottomLineAlpha
      self.errorAlpha = errorAlpha
      
   }
   
   /// This property is for when you are editing a text field
   static var active: TextFieldState {
      return TextFieldState(placeholderFont: Fonts.Regular.sixteen, placeholderY: 0, placeholderColor: .blue, placeholderAlpha: 1.0, bottomLineColor: .blue, bottomLineAlpha: 1.0, errorAlpha: 0.0)
   }
   
   /// This property is for when a User are done editing a text field and everything is correct
   static var nonActiveGood: TextFieldState {
      return TextFieldState(placeholderFont: Fonts.Regular.sixteen, placeholderY: 0, placeholderColor: .black, placeholderAlpha: 0.38, bottomLineColor: .black, bottomLineAlpha: 0.38, errorAlpha: 0.0)
   }
   
   /// This property is for when a User is done editing and an error has occured
   static var nonActiveError: TextFieldState {
      return TextFieldState(placeholderFont: Fonts.Regular.sixteen, placeholderY: 0, placeholderColor: .red, placeholderAlpha: 1.0, bottomLineColor: .red, bottomLineAlpha: 1.0, errorAlpha: 1.0)
   }
   
   /// This property is for when a User hasn't edited and tries to submit
   static var required: TextFieldState {
      return TextFieldState(placeholderFont: Fonts.Medium.twentyFour, placeholderY: 27, placeholderColor: .red, placeholderAlpha: 0.38, bottomLineColor: .red, bottomLineAlpha: 0.38, errorAlpha: 1.0)
   }
   
   /// This property is for before a User has interacted or not text was entered
   static var start: TextFieldState {
      return TextFieldState(placeholderFont: Fonts.Medium.twentyFour, placeholderY: 27, placeholderColor: .black, placeholderAlpha: 0.38, bottomLineColor: .black, bottomLineAlpha: 0.38, errorAlpha: 0.0)
   }
}






