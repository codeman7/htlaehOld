//
//  PasswordField.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/7/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol RevealAlpha {
   var hiding: Bool {get set}
   func showWithAlpha()
   func showWithAlpha(_ delay: TimeInterval)
   func showWithAlpha(_ delay: TimeInterval, alpha: CGFloat)
   func hideWithAlpha()
   func hideWithAlpha(_ delay: TimeInterval)
}

extension RevealAlpha where Self : UIView {
   var hiding: Bool {
      get {
         if self.alpha == 0.0 {
            return true
         } else {
            return false
         }
      }
      
      set(hide) {
         if hide == true {
            self.alpha = 0.0
         }
      }
   }
   
   func showWithAlpha() {
      UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions(), animations: {self.alpha = 1.0}, completion: nil)
   }
   
   func showWithAlpha(_ delay: Double, alpha: CGFloat) {
      let d: Delay = Delay()
      d.delay(delay, closure: {
         UIView.animate(withDuration: 0.3, animations: { self.alpha = alpha })
      })
   }
   
   func showWithAlpha(_ delay: TimeInterval) {
      UIView.animate(withDuration: 0.3, delay: delay, options: UIViewAnimationOptions(), animations: {self.alpha = 1.0}, completion: nil)
   }
   
   func hideWithAlpha() {
      UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions(), animations: {self.alpha = 0.0}, completion: nil)
   }
   
   func hideWithAlpha(_ delay: TimeInterval) {
      UIView.animate(withDuration: 0.3, delay: delay, options: UIViewAnimationOptions(), animations: {self.alpha = 0.0}, completion: nil)
   }
}
