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
   func showWithAlpha(delay: NSTimeInterval)
   func showWithAlpha(delay: NSTimeInterval, alpha: CGFloat)
   func hideWithAlpha()
   func hideWithAlpha(delay: NSTimeInterval)
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
      UIView.animateWithDuration(0.3, animations: {self.alpha = 1.0}, completion: nil)
   }
   
   func showWithAlpha(delay: Double, alpha: CGFloat) {
      let d: Delay = Delay()
      d.delay(delay, closure: {
         UIView.animateWithDuration(0.3, animations: { self.alpha = alpha })
      })
   }
   
   func showWithAlpha(delay: NSTimeInterval) {
      UIView.animateWithDuration(0.3, animations: {self.alpha = 1.0}, completion: nil)
   }
   
   func hideWithAlpha() {
      UIView.animateWithDuration(0.3, animations: {self.alpha = 0.0}, completion: nil)
   }
   
   func hideWithAlpha(delay: NSTimeInterval) {
      UIView.animateWithDuration(0.3, animations: {self.alpha = 0.0}, completion: nil)
   }
}
