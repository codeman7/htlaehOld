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
   static var content: HomeLabel {
      return HomeLabel(font: .regular36, alpha: 0.87)
   }
   
   static var hint: HomeLabel {
      return HomeLabel(font: .medium12, alpha: 0.38)
   }
   
   static var bigLabel: HomeLabel {
      return HomeLabel(font: .bold36, alpha: 0.87)
   }
   
   static var accent: HomeLabel {
      return HomeLabel(font: .regular24, alpha: 0.54)
   }
   
   static var message: HomeLabel {
      return HomeLabel(font: .medium16, alpha: 0.54)
   }
}
