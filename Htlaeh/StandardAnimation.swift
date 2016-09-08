//
//  StandardAnimation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
   func standardAnimation(_ animation: @escaping () -> Void) {
      UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions(), animations: animation, completion: nil)
   }
   
   func animations(_ animation: @escaping ()->Void, duration: TimeInterval) {
      UIView.animate(withDuration: duration, delay: 0.0, options: UIViewAnimationOptions(), animations: animation, completion: nil)
   }
   
}
