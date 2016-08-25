//
//  Color.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
   convenience public init(hex: Int) {
      
      let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
      let blue = CGFloat((hex & 0xFF)) / 255.0
      self.init(red:red, green:green, blue:blue, alpha: 1.0)
      
   }
   
   convenience public init(hex: Int, alpha: CGFloat) {
      
      let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
      let blue = CGFloat((hex & 0xFF)) / 255.0
      self.init(red:red, green:green, blue:blue, alpha: alpha)
      
   }
   
   
}

extension UIColor {
   
   // Blue
   @nonobjc static let primary = UIColor(hex: 0x2196F3)
   // Red
   @nonobjc static let secondary = UIColor(hex: 0xF44336)
   // Yellow
   @nonobjc static let third = UIColor(hex: 0xFFEB3B)
   
   // Reds
   @nonobjc static let red = UIColor(hex: 0xF44336)
   @nonobjc static let red100 = UIColor(hex: 0xFFCDD2)
   @nonobjc static let red200 = UIColor(hex: 0xEF9A9A)
   @nonobjc static let red300 = UIColor(hex: 0xE57373)
   @nonobjc static let red400 = UIColor(hex: 0xEF5350)
   @nonobjc static let red500 = UIColor(hex: 0xF44336)
   @nonobjc static let red600 = UIColor(hex: 0xE53935)
   @nonobjc static let red700 = UIColor(hex: 0xD32F2F)
   @nonobjc static let red800 = UIColor(hex: 0xC62828)
   @nonobjc static let red900 = UIColor(hex: 0xB71C1C)
   
   // Pinks
   @nonobjc static let pink = UIColor(hex: 0xE91E63)
   @nonobjc static let pink100 = UIColor(hex: 0xF8BBD0)
   @nonobjc static let pink200 = UIColor(hex: 0xF48FB1)
   @nonobjc static let pink300 = UIColor(hex: 0xF06292)
   @nonobjc static let pink400 = UIColor(hex: 0xEC407A)
   @nonobjc static let pink500 = UIColor(hex: 0xE91E63)
   @nonobjc static let pink600 = UIColor(hex: 0xD81B60)
   @nonobjc static let pink700 = UIColor(hex: 0xC2185B)
   @nonobjc static let pink800 = UIColor(hex: 0xAD1457)
   @nonobjc static let pink900 = UIColor(hex: 0x880E4F)
   
   // Purples
   @nonobjc static let purple = UIColor(hex: 0x9C27B0)
   @nonobjc static let purple100 = UIColor(hex: 0xE1BEE7)
   @nonobjc static let purple200 = UIColor(hex: 0xCE93D8)
   @nonobjc static let purple300 = UIColor(hex: 0xBA68C8)
   @nonobjc static let purple400 = UIColor(hex: 0xAB47BC)
   @nonobjc static let purple500 = UIColor(hex: 0x9C27B0)
   @nonobjc static let purple600 = UIColor(hex: 0x8E24AA)
   @nonobjc static let purple700 = UIColor(hex: 0x7B1FA2)
   @nonobjc static let purple800 = UIColor(hex: 0x6A1B9A)
   @nonobjc static let purple900 = UIColor(hex: 0x4A148C)
   
   // Deep purples
   @nonobjc static let deepPurple = UIColor(hex: 0x673AB7)
   @nonobjc static let deepPurple100 = UIColor(hex: 0xD1C4E9)
   @nonobjc static let deepPurple200 = UIColor(hex: 0xB39DDB)
   @nonobjc static let deepPurple300 = UIColor(hex: 0x9575CD)
   @nonobjc static let deepPurple400 = UIColor(hex: 0x7E57C2)
   @nonobjc static let deepPurple500 = UIColor(hex: 0x673AB7)
   @nonobjc static let deepPurple600 = UIColor(hex: 0x5E35B1)
   @nonobjc static let deepPurple700 = UIColor(hex: 0x512DA8)
   @nonobjc static let deepPurple800 = UIColor(hex: 0x4527A0)
   @nonobjc static let deepPurple900 = UIColor(hex: 0x311B92)
   
   // Indigos
   @nonobjc static let indigo = UIColor(hex: 0x3F51B5)
   @nonobjc static let indigo100 = UIColor(hex: 0xC5CAE9)
   @nonobjc static let indigo200 = UIColor(hex: 0x9FA8DA)
   @nonobjc static let indigo300 = UIColor(hex: 0x7986CB)
   @nonobjc static let indigo400 = UIColor(hex: 0x5C6BC0)
   @nonobjc static let indigo500 = UIColor(hex: 0x3F51B5)
   @nonobjc static let indigo600 = UIColor(hex: 0x3949AB)
   @nonobjc static let indigo700 = UIColor(hex: 0x303F9F)
   @nonobjc static let indigo800 = UIColor(hex: 0x283593)
   @nonobjc static let indigo900 = UIColor(hex: 0x1A237E)
   
   // Blues
   @nonobjc static let blue = UIColor(hex: 0x2196F3)
   @nonobjc static let blue100 = UIColor(hex: 0xBBDEFB)
   @nonobjc static let blue200 = UIColor(hex: 0x90CAF9)
   @nonobjc static let blue300 = UIColor(hex: 0x64B5F6)
   @nonobjc static let blue400 = UIColor(hex: 0x42A5F5)
   @nonobjc static let blue500 = UIColor(hex: 0x2196F3)
   @nonobjc static let blue600 = UIColor(hex: 0x1E88E5)
   @nonobjc static let blue700 = UIColor(hex: 0x1976D2)
   @nonobjc static let blue800 = UIColor(hex: 0x1565C0)
   @nonobjc static let blue900 = UIColor(hex: 0x0D47A1)
   
   // Light blues
   @nonobjc static let lightBlue = UIColor(hex: 0x03A9F4)
   @nonobjc static let lightBlue100 = UIColor(hex: 0xB3E5FC)
   @nonobjc static let lightBlue200 = UIColor(hex: 0x81D4FA)
   @nonobjc static let lightBlue300 = UIColor(hex: 0x4FC3F7)
   @nonobjc static let lightBlue400 = UIColor(hex: 0x29B6F6)
   @nonobjc static let lightBlue500 = UIColor(hex: 0x03A9F4)
   @nonobjc static let lightBlue600 = UIColor(hex: 0x039BE5)
   @nonobjc static let lightBlue700 = UIColor(hex: 0x0288D1)
   @nonobjc static let lightBlue800 = UIColor(hex: 0x0277BD)
   @nonobjc static let lightBlue900 = UIColor(hex: 0x01579B)
   
   // Cyans
   @nonobjc static let cyan = UIColor(hex: 0x00BCD4)
   @nonobjc static let cyan100 = UIColor(hex: 0xB2EBF2)
   @nonobjc static let cyan200 = UIColor(hex: 0x80DEEA)
   @nonobjc static let cyan300 = UIColor(hex: 0x4DD0E1)
   @nonobjc static let cyan400 = UIColor(hex: 0x26C6DA)
   @nonobjc static let cyan500 = UIColor(hex: 0x00BCD4)
   @nonobjc static let cyan600 = UIColor(hex: 0x00ACC1)
   @nonobjc static let cyan700 = UIColor(hex: 0x0097A7)
   @nonobjc static let cyan800 = UIColor(hex: 0x00838F)
   @nonobjc static let cyan900 = UIColor(hex: 0x006064)
   
   // Teals
   @nonobjc static let teal = UIColor(hex: 0x009688)
   @nonobjc static let teal100 = UIColor(hex: 0xB2DFDB)
   @nonobjc static let teal200 = UIColor(hex: 0x80CBC4)
   @nonobjc static let teal300 = UIColor(hex: 0x4DB6AC)
   @nonobjc static let teal400 = UIColor(hex: 0x26A69A)
   @nonobjc static let teal500 = UIColor(hex: 0x009688)
   @nonobjc static let teal600 = UIColor(hex: 0x00897B)
   @nonobjc static let teal700 = UIColor(hex: 0x00796B)
   @nonobjc static let teal800 = UIColor(hex: 0x00695C)
   @nonobjc static let teal900 = UIColor(hex: 0x004D40)
   
   // Greens
   @nonobjc static let green = UIColor(hex: 0x4CAF50)
   @nonobjc static let green100 = UIColor(hex: 0xC8E6C9)
   @nonobjc static let green200 = UIColor(hex: 0xA5D6A7)
   @nonobjc static let green300 = UIColor(hex: 0x81C784)
   @nonobjc static let green400 = UIColor(hex: 0x66BB6A)
   @nonobjc static let green500 = UIColor(hex: 0x4CAF50)
   @nonobjc static let green600 = UIColor(hex: 0x43A047)
   @nonobjc static let green700 = UIColor(hex: 0x388E3C)
   @nonobjc static let green800 = UIColor(hex: 0x2E7D32)
   @nonobjc static let green900 = UIColor(hex: 0x1B5E20)
   
   // Light greens
   @nonobjc static let lightGreen = UIColor(hex: 0x8BC34A)
   @nonobjc static let lightGreen100 = UIColor(hex: 0xDCEDC8)
   @nonobjc static let lightGreen200 = UIColor(hex: 0xC5E1A5)
   @nonobjc static let lightGreen300 = UIColor(hex: 0xAED581)
   @nonobjc static let lightGreen400 = UIColor(hex: 0x9CCC65)
   @nonobjc static let lightGreen500 = UIColor(hex: 0x8BC34A)
   @nonobjc static let lightGreen600 = UIColor(hex: 0x7CB342)
   @nonobjc static let lightGreen700 = UIColor(hex: 0x689F38)
   @nonobjc static let lightGreen800 = UIColor(hex: 0x558B2F)
   @nonobjc static let lightGreen900 = UIColor(hex: 0x33691E)
   
   // Limes
   @nonobjc static let lime = UIColor(hex: 0xCDDC39)
   @nonobjc static let lime100 = UIColor(hex: 0xF0F4C3)
   @nonobjc static let lime200 = UIColor(hex: 0xE6EE9C)
   @nonobjc static let lime300 = UIColor(hex: 0xDCE775)
   @nonobjc static let lime400 = UIColor(hex: 0xD4E157)
   @nonobjc static let lime500 = UIColor(hex: 0xCDDC39)
   @nonobjc static let lime600 = UIColor(hex: 0xC0CA33)
   @nonobjc static let lime700 = UIColor(hex: 0xAFB42B)
   @nonobjc static let lime800 = UIColor(hex: 0x9E9D24)
   @nonobjc static let lime900 = UIColor(hex: 0x827717)
   
   // Yellows
   @nonobjc static let yellow = UIColor(hex: 0xFFEB3B)
   @nonobjc static let yellow100 = UIColor(hex: 0xFFF9C4)
   @nonobjc static let yellow200 = UIColor(hex: 0xFFF59D)
   @nonobjc static let yellow300 = UIColor(hex: 0xFFF176)
   @nonobjc static let yellow400 = UIColor(hex: 0xFFEE58)
   @nonobjc static let yellow500 = UIColor(hex: 0xFFEB3B)
   @nonobjc static let yellow600 = UIColor(hex: 0xFDD835)
   @nonobjc static let yellow700 = UIColor(hex: 0xFBC02D)
   @nonobjc static let yellow800 = UIColor(hex: 0xF9A825)
   @nonobjc static let yellow900 = UIColor(hex: 0xF57F17)
   
   // Ambers
   @nonobjc static let amber = UIColor(hex: 0xFFC107)
   @nonobjc static let amber100 = UIColor(hex: 0xFFECB3)
   @nonobjc static let amber200 = UIColor(hex: 0xFFE082)
   @nonobjc static let amber300 = UIColor(hex: 0xFFD54F)
   @nonobjc static let amber400 = UIColor(hex: 0xFFCA28)
   @nonobjc static let amber500 = UIColor(hex: 0xFFC107)
   @nonobjc static let amber600 = UIColor(hex: 0xFFB300)
   @nonobjc static let amber700 = UIColor(hex: 0xFFA000)
   @nonobjc static let amber800 = UIColor(hex: 0xFF8F00)
   @nonobjc static let amber900 = UIColor(hex: 0xFF6F00)
   
   // Oranges
   @nonobjc static let orange = UIColor(hex: 0xFF9800)
   @nonobjc static let orange100 = UIColor(hex: 0xFFE0B2)
   @nonobjc static let orange200 = UIColor(hex: 0xFFCC80)
   @nonobjc static let orange300 = UIColor(hex: 0xFFB74D)
   @nonobjc static let orange400 = UIColor(hex: 0xFFA726)
   @nonobjc static let orange500 = UIColor(hex: 0xFF9800)
   @nonobjc static let orange600 = UIColor(hex: 0xFB8C00)
   @nonobjc static let orange700 = UIColor(hex: 0xF57C00)
   @nonobjc static let orange800 = UIColor(hex: 0xEF6C00)
   @nonobjc static let orange900 = UIColor(hex: 0xE65100)
   
   // Deep oranges
   @nonobjc static let deepOrange = UIColor(hex: 0xFF5722)
   @nonobjc static let deepOrange100 = UIColor(hex: 0xFFCCBC)
   @nonobjc static let deepOrange200 = UIColor(hex: 0xFFAB91)
   @nonobjc static let deepOrange300 = UIColor(hex: 0xFF8A65)
   @nonobjc static let deepOrange400 = UIColor(hex: 0xFF7043)
   @nonobjc static let deepOrange500 = UIColor(hex: 0xFF5722)
   @nonobjc static let deepOrange600 = UIColor(hex: 0xF4511E)
   @nonobjc static let deepOrange700 = UIColor(hex: 0xE64A19)
   @nonobjc static let deepOrange800 = UIColor(hex: 0xD84315)
   @nonobjc static let deepOrange900 = UIColor(hex: 0xBF360C)
   
   // Browns
   @nonobjc static let brown = UIColor(hex: 0x795548)
   @nonobjc static let brown100 = UIColor(hex: 0xD7CCC8)
   @nonobjc static let brown200 = UIColor(hex: 0xBCAAA4)
   @nonobjc static let brown300 = UIColor(hex: 0xA1887F)
   @nonobjc static let brown400 = UIColor(hex: 0x8D6E63)
   @nonobjc static let brown500 = UIColor(hex: 0x795548)
   @nonobjc static let brown600 = UIColor(hex: 0x6D4C41)
   @nonobjc static let brown700 = UIColor(hex: 0x5D4037)
   @nonobjc static let brown800 = UIColor(hex: 0x4E342E)
   @nonobjc static let brown900 = UIColor(hex: 0x3E2723)
   
   // Greys
   @nonobjc static let grey = UIColor(hex: 0x9E9E9E)
   @nonobjc static let grey50 = UIColor(hex: 0xFAFAFA)
   @nonobjc static let grey100 = UIColor(hex: 0xF5F5F5)
   @nonobjc static let grey200 = UIColor(hex: 0xEEEEEE)
   @nonobjc static let grey300 = UIColor(hex: 0xE0E0E0)
   @nonobjc static let grey400 = UIColor(hex: 0xBDBDBD)
   @nonobjc static let grey500 = UIColor(hex: 0x9E9E9E)
   @nonobjc static let grey600 = UIColor(hex: 0x757575)
   @nonobjc static let grey700 = UIColor(hex: 0x616161)
   @nonobjc static let grey800 = UIColor(hex: 0x424242)
   @nonobjc static let grey900 = UIColor(hex: 0x212121)
   
   // Black
   @nonobjc static let black = UIColor(hex: 0x000000)
   
   // White
   @nonobjc static let white = UIColor(hex: 0xFFFFFF)
}

struct Color {
   // Blue
   static let primary = UIColor(hex: 0x2196F3)
   // Red
   static let secondary = UIColor(hex: 0xF44336)
   // Yellow
   static let third = UIColor(hex: 0xFFEB3B)
   
   // Reds
   static let red = UIColor(hex: 0xF44336)
   static let red100 = UIColor(hex: 0xFFCDD2)
   static let red200 = UIColor(hex: 0xEF9A9A)
   static let red300 = UIColor(hex: 0xE57373)
   static let red400 = UIColor(hex: 0xEF5350)
   static let red500 = UIColor(hex: 0xF44336)
   static let red600 = UIColor(hex: 0xE53935)
   static let red700 = UIColor(hex: 0xD32F2F)
   static let red800 = UIColor(hex: 0xC62828)
   static let red900 = UIColor(hex: 0xB71C1C)
   
   // Pinks
   static let pink = UIColor(hex: 0xE91E63)
   static let pink100 = UIColor(hex: 0xF8BBD0)
   static let pink200 = UIColor(hex: 0xF48FB1)
   static let pink300 = UIColor(hex: 0xF06292)
   static let pink400 = UIColor(hex: 0xEC407A)
   static let pink500 = UIColor(hex: 0xE91E63)
   static let pink600 = UIColor(hex: 0xD81B60)
   static let pink700 = UIColor(hex: 0xC2185B)
   static let pink800 = UIColor(hex: 0xAD1457)
   static let pink900 = UIColor(hex: 0x880E4F)
   
   // Purples
   static let purple = UIColor(hex: 0x9C27B0)
   static let purple100 = UIColor(hex: 0xE1BEE7)
   static let purple200 = UIColor(hex: 0xCE93D8)
   static let purple300 = UIColor(hex: 0xBA68C8)
   static let purple400 = UIColor(hex: 0xAB47BC)
   static let purple500 = UIColor(hex: 0x9C27B0)
   static let purple600 = UIColor(hex: 0x8E24AA)
   static let purple700 = UIColor(hex: 0x7B1FA2)
   static let purple800 = UIColor(hex: 0x6A1B9A)
   static let purple900 = UIColor(hex: 0x4A148C)
   
   // Deep purples
   static let deepPurple = UIColor(hex: 0x673AB7)
   static let deepPurple100 = UIColor(hex: 0xD1C4E9)
   static let deepPurple200 = UIColor(hex: 0xB39DDB)
   static let deepPurple300 = UIColor(hex: 0x9575CD)
   static let deepPurple400 = UIColor(hex: 0x7E57C2)
   static let deepPurple500 = UIColor(hex: 0x673AB7)
   static let deepPurple600 = UIColor(hex: 0x5E35B1)
   static let deepPurple700 = UIColor(hex: 0x512DA8)
   static let deepPurple800 = UIColor(hex: 0x4527A0)
   static let deepPurple900 = UIColor(hex: 0x311B92)
   
   // Indigos
   static let indigo = UIColor(hex: 0x3F51B5)
   static let indigo100 = UIColor(hex: 0xC5CAE9)
   static let indigo200 = UIColor(hex: 0x9FA8DA)
   static let indigo300 = UIColor(hex: 0x7986CB)
   static let indigo400 = UIColor(hex: 0x5C6BC0)
   static let indigo500 = UIColor(hex: 0x3F51B5)
   static let indigo600 = UIColor(hex: 0x3949AB)
   static let indigo700 = UIColor(hex: 0x303F9F)
   static let indigo800 = UIColor(hex: 0x283593)
   static let indigo900 = UIColor(hex: 0x1A237E)
   
   // Blues
   static let blue = UIColor(hex: 0x2196F3)
   static let blue100 = UIColor(hex: 0xBBDEFB)
   static let blue200 = UIColor(hex: 0x90CAF9)
   static let blue300 = UIColor(hex: 0x64B5F6)
   static let blue400 = UIColor(hex: 0x42A5F5)
   static let blue500 = UIColor(hex: 0x2196F3)
   static let blue600 = UIColor(hex: 0x1E88E5)
   static let blue700 = UIColor(hex: 0x1976D2)
   static let blue800 = UIColor(hex: 0x1565C0)
   static let blue900 = UIColor(hex: 0x0D47A1)
   
   // Light blues
   static let lightBlue = UIColor(hex: 0x03A9F4)
   static let lightBlue100 = UIColor(hex: 0xB3E5FC)
   static let lightBlue200 = UIColor(hex: 0x81D4FA)
   static let lightBlue300 = UIColor(hex: 0x4FC3F7)
   static let lightBlue400 = UIColor(hex: 0x29B6F6)
   static let lightBlue500 = UIColor(hex: 0x03A9F4)
   static let lightBlue600 = UIColor(hex: 0x039BE5)
   static let lightBlue700 = UIColor(hex: 0x0288D1)
   static let lightBlue800 = UIColor(hex: 0x0277BD)
   static let lightBlue900 = UIColor(hex: 0x01579B)
   
   // Cyans
   static let cyan = UIColor(hex: 0x00BCD4)
   static let cyan100 = UIColor(hex: 0xB2EBF2)
   static let cyan200 = UIColor(hex: 0x80DEEA)
   static let cyan300 = UIColor(hex: 0x4DD0E1)
   static let cyan400 = UIColor(hex: 0x26C6DA)
   static let cyan500 = UIColor(hex: 0x00BCD4)
   static let cyan600 = UIColor(hex: 0x00ACC1)
   static let cyan700 = UIColor(hex: 0x0097A7)
   static let cyan800 = UIColor(hex: 0x00838F)
   static let cyan900 = UIColor(hex: 0x006064)
   
   // Teals
   static let teal = UIColor(hex: 0x009688)
   static let teal100 = UIColor(hex: 0xB2DFDB)
   static let teal200 = UIColor(hex: 0x80CBC4)
   static let teal300 = UIColor(hex: 0x4DB6AC)
   static let teal400 = UIColor(hex: 0x26A69A)
   static let teal500 = UIColor(hex: 0x009688)
   static let teal600 = UIColor(hex: 0x00897B)
   static let teal700 = UIColor(hex: 0x00796B)
   static let teal800 = UIColor(hex: 0x00695C)
   static let teal900 = UIColor(hex: 0x004D40)
   
   // Greens
   static let green = UIColor(hex: 0x4CAF50)
   static let green100 = UIColor(hex: 0xC8E6C9)
   static let green200 = UIColor(hex: 0xA5D6A7)
   static let green300 = UIColor(hex: 0x81C784)
   static let green400 = UIColor(hex: 0x66BB6A)
   static let green500 = UIColor(hex: 0x4CAF50)
   static let green600 = UIColor(hex: 0x43A047)
   static let green700 = UIColor(hex: 0x388E3C)
   static let green800 = UIColor(hex: 0x2E7D32)
   static let green900 = UIColor(hex: 0x1B5E20)
   
   // Light greens
   static let lightGreen = UIColor(hex: 0x8BC34A)
   static let lightGreen100 = UIColor(hex: 0xDCEDC8)
   static let lightGreen200 = UIColor(hex: 0xC5E1A5)
   static let lightGreen300 = UIColor(hex: 0xAED581)
   static let lightGreen400 = UIColor(hex: 0x9CCC65)
   static let lightGreen500 = UIColor(hex: 0x8BC34A)
   static let lightGreen600 = UIColor(hex: 0x7CB342)
   static let lightGreen700 = UIColor(hex: 0x689F38)
   static let lightGreen800 = UIColor(hex: 0x558B2F)
   static let lightGreen900 = UIColor(hex: 0x33691E)
   
   // Limes
   static let lime = UIColor(hex: 0xCDDC39)
   static let lime100 = UIColor(hex: 0xF0F4C3)
   static let lime200 = UIColor(hex: 0xE6EE9C)
   static let lime300 = UIColor(hex: 0xDCE775)
   static let lime400 = UIColor(hex: 0xD4E157)
   static let lime500 = UIColor(hex: 0xCDDC39)
   static let lime600 = UIColor(hex: 0xC0CA33)
   static let lime700 = UIColor(hex: 0xAFB42B)
   static let lime800 = UIColor(hex: 0x9E9D24)
   static let lime900 = UIColor(hex: 0x827717)
   
   // Yellows
   static let yellow = UIColor(hex: 0xFFEB3B)
   static let yellow100 = UIColor(hex: 0xFFF9C4)
   static let yellow200 = UIColor(hex: 0xFFF59D)
   static let yellow300 = UIColor(hex: 0xFFF176)
   static let yellow400 = UIColor(hex: 0xFFEE58)
   static let yellow500 = UIColor(hex: 0xFFEB3B)
   static let yellow600 = UIColor(hex: 0xFDD835)
   static let yellow700 = UIColor(hex: 0xFBC02D)
   static let yellow800 = UIColor(hex: 0xF9A825)
   static let yellow900 = UIColor(hex: 0xF57F17)
   
   // Ambers
   static let amber = UIColor(hex: 0xFFC107)
   static let amber100 = UIColor(hex: 0xFFECB3)
   static let amber200 = UIColor(hex: 0xFFE082)
   static let amber300 = UIColor(hex: 0xFFD54F)
   static let amber400 = UIColor(hex: 0xFFCA28)
   static let amber500 = UIColor(hex: 0xFFC107)
   static let amber600 = UIColor(hex: 0xFFB300)
   static let amber700 = UIColor(hex: 0xFFA000)
   static let amber800 = UIColor(hex: 0xFF8F00)
   static let amber900 = UIColor(hex: 0xFF6F00)
   
   // Oranges
   static let orange = UIColor(hex: 0xFF9800)
   static let orange100 = UIColor(hex: 0xFFE0B2)
   static let orange200 = UIColor(hex: 0xFFCC80)
   static let orange300 = UIColor(hex: 0xFFB74D)
   static let orange400 = UIColor(hex: 0xFFA726)
   static let orange500 = UIColor(hex: 0xFF9800)
   static let orange600 = UIColor(hex: 0xFB8C00)
   static let orange700 = UIColor(hex: 0xF57C00)
   static let orange800 = UIColor(hex: 0xEF6C00)
   static let orange900 = UIColor(hex: 0xE65100)
   
   // Deep oranges
   static let deepOrange = UIColor(hex: 0xFF5722)
   static let deepOrange100 = UIColor(hex: 0xFFCCBC)
   static let deepOrange200 = UIColor(hex: 0xFFAB91)
   static let deepOrange300 = UIColor(hex: 0xFF8A65)
   static let deepOrange400 = UIColor(hex: 0xFF7043)
   static let deepOrange500 = UIColor(hex: 0xFF5722)
   static let deepOrange600 = UIColor(hex: 0xF4511E)
   static let deepOrange700 = UIColor(hex: 0xE64A19)
   static let deepOrange800 = UIColor(hex: 0xD84315)
   static let deepOrange900 = UIColor(hex: 0xBF360C)
   
   // Browns
   static let brown = UIColor(hex: 0x795548)
   static let brown100 = UIColor(hex: 0xD7CCC8)
   static let brown200 = UIColor(hex: 0xBCAAA4)
   static let brown300 = UIColor(hex: 0xA1887F)
   static let brown400 = UIColor(hex: 0x8D6E63)
   static let brown500 = UIColor(hex: 0x795548)
   static let brown600 = UIColor(hex: 0x6D4C41)
   static let brown700 = UIColor(hex: 0x5D4037)
   static let brown800 = UIColor(hex: 0x4E342E)
   static let brown900 = UIColor(hex: 0x3E2723)
   
   // Greys
   static let grey = UIColor(hex: 0x9E9E9E)
   static let grey50 = UIColor(hex: 0xFAFAFA)
   static let grey100 = UIColor(hex: 0xF5F5F5)
   static let grey200 = UIColor(hex: 0xEEEEEE)
   static let grey300 = UIColor(hex: 0xE0E0E0)
   static let grey400 = UIColor(hex: 0xBDBDBD)
   static let grey500 = UIColor(hex: 0x9E9E9E)
   static let grey600 = UIColor(hex: 0x757575)
   static let grey700 = UIColor(hex: 0x616161)
   static let grey800 = UIColor(hex: 0x424242)
   static let grey900 = UIColor(hex: 0x212121)
   
   // Black
   static let black = UIColor(hex: 0x000000)
   
   // White
   static let white = UIColor(hex: 0xFFFFFF)
   
}
