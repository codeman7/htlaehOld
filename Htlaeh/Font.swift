//
//  Font.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This Enum is strictly for typefaces that raw value are mapped to the name of the font
 */
public enum Typeface: String {
   
   case Thin = "Roboto-Thin"
   case Bold = "Roboto-Bold"
   case Regular = "Roboto-Regular"
   case Medium = "Roboto-Medium"
   case Light = "Roboto-Light"
   
}

/// Extension to accept values from typeface in initializer
extension UIFont {
   convenience public init(name: Typeface, size: CGFloat) {
      self.init(name: name.rawValue, size: size)!
   }
   
}

extension UIFont {
   // MARK: Thin
   @nonobjc static let thin8: UIFont = UIFont(name: .Thin, size: 8.0)
   @nonobjc static let thin32: UIFont = UIFont(name: .Thin, size: 32.0)
   @nonobjc static let thin40: UIFont = UIFont(name: .Thin, size: 40.0)
   
   // MARK: Bold
   @nonobjc static let bold6: UIFont = UIFont(name: .Bold, size: 6.0)
   @nonobjc static let bold8: UIFont = UIFont(name: .Bold, size: 8.0)
   @nonobjc static let bold12: UIFont = UIFont(name: .Bold, size: 12.0)
   @nonobjc static let bold36: UIFont = UIFont(name: .Bold, size: 36.0)
   @nonobjc static let bold40: UIFont = UIFont(name: .Bold, size: 40.0)
   
   
   // MARK: Regular
   @nonobjc static let regular12: UIFont = UIFont(name: .Regular, size: 12.0)
   @nonobjc static let regular14: UIFont = UIFont(name: .Regular, size: 14.0)
   @nonobjc static let regular16: UIFont = UIFont(name: .Regular, size: 16.0)
   @nonobjc static let regular18: UIFont = UIFont(name: .Regular, size: 18.0)
   @nonobjc static let regular20: UIFont = UIFont(name: .Regular, size: 20.0)
   @nonobjc static let regular24: UIFont = UIFont(name: .Regular, size: 24.0)
   @nonobjc static let regular32: UIFont = UIFont(name: .Regular, size: 32.0)
   @nonobjc static let regular36: UIFont = UIFont(name: .Regular, size: 36.0)
   @nonobjc static let regular40: UIFont = UIFont(name: .Regular, size: 40.0)
   @nonobjc static let regular60: UIFont = UIFont(name: .Regular, size: 60.0)
   
   // MARK: Light
   @nonobjc static let light8: UIFont = UIFont(name: .Light, size: 8.0)
   @nonobjc static let light10: UIFont = UIFont(name: .Light, size: 10.0)
   @nonobjc static let light12: UIFont = UIFont(name: .Light, size: 12.0)
   @nonobjc static let light20: UIFont = UIFont(name: .Light, size: 20.0)
   @nonobjc static let light24: UIFont = UIFont(name: .Light, size: 24.0)
   @nonobjc static let light32: UIFont = UIFont(name: .Light, size: 32.0)
   @nonobjc static let light40: UIFont = UIFont(name: .Light, size: 40.0)
   @nonobjc static let light48: UIFont = UIFont(name: .Light, size: 48.0)
   @nonobjc static let light56: UIFont = UIFont(name: .Light, size: 56.0)
   @nonobjc static let light72: UIFont = UIFont(name: .Light, size: 72.0)
   
   // MARK: Medium
   @nonobjc  static let medium8: UIFont = UIFont(name: .Medium, size: 8.0)
   @nonobjc static let medium10: UIFont = UIFont(name: .Medium, size: 10.0)
   @nonobjc static let medium12: UIFont = UIFont(name: .Medium, size: 12.0)
   @nonobjc static let medium14: UIFont = UIFont(name: .Medium, size: 14.0)
   @nonobjc static let medium16: UIFont = UIFont(name: .Medium, size: 16.0)
   @nonobjc static let medium18: UIFont = UIFont(name: .Medium, size: 18.0)
   @nonobjc static let medium20: UIFont = UIFont(name: .Medium, size: 20.0)
   @nonobjc static let medium24: UIFont = UIFont(name: .Medium, size: 24.0)
   @nonobjc static let medium28: UIFont = UIFont(name: .Medium, size: 28.0)
   @nonobjc static let medium32: UIFont = UIFont(name: .Medium, size: 32.0)
   @nonobjc static let medium36: UIFont = UIFont(name: .Medium, size: 36.0)
   @nonobjc static let medium40: UIFont = UIFont(name: .Medium, size: 40.0)
}

/**
   Use this struct for all Fonts the sub structs are for each different typeface
 */
struct Fonts {
   struct Thin {
      // MARK: Thin
      static let  eight: UIFont = UIFont(name: .Thin, size: 8.0)
      static let thirtyTwo: UIFont = UIFont(name: .Thin, size: 32.0)
      static let fourty: UIFont = UIFont(name: .Thin, size: 40.0)
   }
   
   struct Bold {
      // MARK: Bold
      static let six: UIFont = UIFont(name: .Bold, size: 6.0)
      static let eight: UIFont = UIFont(name: .Bold, size: 8.0)
      static let twelve: UIFont = UIFont(name: .Bold, size: 12.0)
      static let thirtySix: UIFont = UIFont(name: .Bold, size: 36.0)
      static let fourty: UIFont = UIFont(name: .Bold, size: 40.0)
   }
   
   struct Regular {
      // MARK: Regular
      static let twelve: UIFont = UIFont(name: .Regular, size: 12.0)
      static let fourteen: UIFont = UIFont(name: .Regular, size: 14.0)
      static let sixteen: UIFont = UIFont(name: .Regular, size: 16.0)
      static let eighteen: UIFont = UIFont(name: .Regular, size: 18.0)
      static let twenty: UIFont = UIFont(name: .Regular, size: 20.0)
      static let twentyFour: UIFont = UIFont(name: .Regular, size: 24.0)
      static let thirtyTwo: UIFont = UIFont(name: .Regular, size: 32.0)
      static let thirtySix: UIFont = UIFont(name: .Regular, size: 36.0)
      static let fourty: UIFont = UIFont(name: .Regular, size: 40.0)
      static let sixty: UIFont = UIFont(name: .Regular, size: 60.0)
   }
   
   struct Light {
      // MARK: Light
      static let eight: UIFont = UIFont(name: .Light, size: 8.0)
      static let ten: UIFont = UIFont(name: .Light, size: 10.0)
      static let twelve: UIFont = UIFont(name: .Light, size: 12.0)
      static let twenty: UIFont = UIFont(name: .Light, size: 20.0)
      static let twentyFour: UIFont = UIFont(name: .Light, size: 24.0)
      static let thrityTwo: UIFont = UIFont(name: .Light, size: 32.0)
      static let fourty: UIFont = UIFont(name: .Light, size: 40.0)
      static let fourtyEight: UIFont = UIFont(name: .Light, size: 48.0)
      static let fiftySix: UIFont = UIFont(name: .Light, size: 56.0)
      static let seventyTwo: UIFont = UIFont(name: .Light, size: 72.0)
   }
   
   struct Medium {
      // MARK: Medium
      static let eight: UIFont = UIFont(name: .Medium, size: 8.0)
      static let ten: UIFont = UIFont(name: .Medium, size: 10.0)
      static let twelve: UIFont = UIFont(name: .Medium, size: 12.0)
      static let fourteen: UIFont = UIFont(name: .Medium, size: 14.0)
      static let sixteen: UIFont = UIFont(name: .Medium, size: 16.0)
      static let eighteen: UIFont = UIFont(name: .Medium, size: 18.0)
      static let twenty: UIFont = UIFont(name: .Medium, size: 20.0)
      static let twentyFour: UIFont = UIFont(name: .Medium, size: 24.0)
      static let twentyEight: UIFont = UIFont(name: .Medium, size: 28.0)
      static let thirtyTwo: UIFont = UIFont(name: .Medium, size: 32.0)
      static let fourty: UIFont = UIFont(name: .Medium, size: 40.0)
   }
}

