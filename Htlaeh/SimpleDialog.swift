//
//  SimpleDialog.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/2/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


class SimpleDialog : UIView {
   
   // MARK: Properties
   let size: CGSize
   let origin: CGPoint
   let buttonInit: [MenuButtonInitializer]

   // MARK: Initializers
   init(origin: CGPoint, expandedSize size: CGSize, buttons: [MenuButtonInitializer]) {
      
      // Set the size and origin properties
      self.size = size
      self.origin = origin
      self.buttonInit = buttons
      // Call the super initializer
      super.init(frame: CGRect(origin: origin, size: CGSize.zero))
      // Elevate the view
      self.elevate(4)
      // Set the background color
      self.backgroundColor = .white
      // Add the buttons
      self.addButtons()
      // Set the alpha to 0
      self.alpha = 0.0
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   fileprivate func addButtons() {
      
      for iteration in 0..<self.buttonInit.count {
         let width: CGFloat = buttonInit[iteration].title.widthWithConstrainedHeight(48.0, font: .regular16)
         let frame: Rect = Rect(x: 20, y: CGFloat(8 + (iteration * 48)), w: width, h: 48.0)
         let button: Button = Button(frame: frame, type: .flat)
         button.set(title: self.buttonInit[iteration].title, color: .black)
         button.label.alpha = 0.74
         button.action = self.buttonInit[iteration].action
         button.alpha = 0.0
         self.addSubview(button)
      }
      
   }
   
   func showButtons() {
      
      UIView.animate(withDuration: 0.025, animations: {
         for view in self.subviews {
            view.alpha = 1.0
         }
      })
      
   }
   
   func removeButtons() {
      
      UIView.animate(withDuration: 0.025, animations: {
         for view in self.subviews {
            view.alpha = 0.0
         }
      })
      
   }
   
   /**
    The function to show the view
    - parameter size: The size the menu will be when shown
    - parameter direction: The direction the view will expand either Left/Right
   */
   func show(_ direction: Direction) {
      
      guard direction == .right || direction == .left else {
            return
      }
      
      self.alpha = 1.0
      let x: CGFloat = (direction == .left) ? self.frame.origin.x - self.size.width : self.frame.origin.x
      let frame: Rect = Rect(origin: CGPoint(x: x, y: self.frame.origin.y), size: self.size)
      UIView.animate(withDuration: 0.175, animations: {
         self.frame = frame
         }, completion: { Bool in
            self.showButtons()
      })

   }
   
   /// Hides the view from visablity
   func hide() {
      
      self.removeButtons()
      
      UIView.animate(withDuration: 0.2, animations: {
         let frame: Rect = Rect(origin: self.origin, size: CGSize.zero)
         self.frame = frame
         }, completion: { Bool in
            self.removeFromSuperview()
      })
      
   }
   
}






