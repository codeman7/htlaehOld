//
//  HomeTextPresentable.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol HomeTextPresentable {
   var font: UIFont { get }
   var alpha: CGFloat { get }
   var color: UIColor { get }
   var alignment: NSTextAlignment { get }
}

extension HomeTextPresentable {
   
   var alignment: NSTextAlignment {
      return .Center
   }
   
   var color: UIColor {
      return .black
   }
   
}

struct HomeLabel : HomeTextPresentable {
   let font: UIFont
   let alpha: CGFloat
   /// This property is for content that is active
   static var content: HomeLabel {
      return HomeLabel(font: .medium36, alpha: 0.87)
   }
   
   /// The property for hint labels that are right above a label
   static var hint: HomeLabel {
      return HomeLabel(font: .medium12, alpha: 0.38)
   }
   
   /// Property for big labels that are in the center of the screen
   static var bigLabel: HomeLabel {
      return HomeLabel(font: .bold36, alpha: 0.87)
   }
   
   
   // Property for labels that are accents that are next up to be active
   static var accent: HomeLabel {
      return HomeLabel(font: .medium24, alpha: 0.54)
   }
   
   /// This property messages when in an error state
   static var message: HomeLabel {
      return HomeLabel(font: .medium16, alpha: 0.54)
   }
}
