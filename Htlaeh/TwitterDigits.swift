//
//  Digits.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/3/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit
import DigitsKit

struct TwitterDigits {
   
   func digitsApperance() -> DGTAppearance {
      
      let apperance = DGTAppearance()
      apperance.backgroundColor = Color().white
      apperance.accentColor = Color().blue
      apperance.logoImage = Images.Htlaeh().logoSmooth
      apperance.headerFont = Fonts.Regular().sixteen
      apperance.labelFont = Fonts.Medium().fourteen
      return apperance
      
   }
   
}