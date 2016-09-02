//
//  SettingsLabel.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/1/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct SettingsLabel : TextPresentable {
   
   let color: UIColor
   let alpha: CGFloat
   let alignment: NSTextAlignment
   let font: UIFont
   
   static var standard: SettingsLabel {
      return SettingsLabel(color: .black, alpha: 0.87, alignment: .Left, font: .medium20)
   }
   
   static var hint: SettingsLabel {
      return SettingsLabel(color: .black, alpha: 0.54, alignment: .Left, font: .regular16)
   }
   
}