//
//  Toast.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/14/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used for a toast or a bottom black little bar
 
   Should never be more than 2 lines of text
 
   Height should be 48pt for single line and 80pt for multiple line
 
   Font - Text Regular 14  Button Medium 14 all Caps
 
   Background color - #323232 with 100% opacity
 
   Padding - 24 pt from both edges and 24 between button and text if button present
 
   If a FAB is present then animate it up
 
 */
class Toast : UIView {
   // MARK: Properties
   
   // MARK: Initializers
   /**
      Default and only initializer
      - parameter frame: The frame that the toast will have - see above
    
    **x** : 0,
    
    **y** : screen height,
   
    **width** : screen width,
    
    **height** : 48
    - parameter text: The text the the message will contain
    */
   init(frame: CGRect, text: String) {
      
      // Call the super initializer
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = .grey900
      // Add the text to the toast
      self.addLabelWith(text)
      // Set the alpha for the view
      self.alpha = 0.0
      
   }
   
   convenience init(frame: Rect, text: String, button: (String, UIColor, ()->())) {
      
      // Call the designated initializer
      self.init(frame: frame, text: text)
      // Add the button
      self.addButtonWith(button.0, color: button.1, action: button.2)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function adds the button to the Toast
      - parameter title: The title for the button
      - parameter color: The color for the text of the button
      - parameter action: The action for the button
   */
   private func addButtonWith(title: String, color: UIColor, action: ()->()) {
      
      // Get the width and frame for the button
      let width: CGFloat = title.widthWithConstrainedHeight(40, font: .medium14)
      let frame: Rect = Rect(x: self.frame.w - (width + 24), y: 4, w: width, h: 40)
      
      // Create the button and add the title
      let button: Button = Button(frame: frame, type: .flat)
      button.set(title: title, color: .yellow)
      
      // Set the action for the button and add as a subview
      button.action = action
      self.addSubview(button)
      
   }
   
   /**
      This function shows the toast
   */
   func show() {
      // Animate the view up
      UIView.animateWithDuration( 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: { self.frame.origin.y -= self.frame.h; self.alpha = 1.0 }, completion: nil)
      // Wait 2.5 seconds and animate the view back down
      UIView.animateWithDuration( 0.25, delay: 2.75, options: UIViewAnimationOptions(), animations: { self.frame.origin.y += self.frame.h; self.alpha = 0.0 }, completion: nil)
      
   }
   
   /**
     This function shows the toast for the given period of time
      - parameter time: How long you want the toast to be visable
   */
   func show(time: Double) {
      
      // Animate the view up
      UIView.animateWithDuration( 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: { self.frame.origin.y -= self.frame.h; self.alpha = 1.0 }, completion: nil)
      // Wait 2.5 seconds and animate the view back down
      UIView.animateWithDuration( 0.25, delay: time + 0.25, options: UIViewAnimationOptions(), animations: { self.frame.origin.y += self.frame.h; self.alpha = 0.0 }, completion: nil)
      
   }
   
   private func addLabelWith(title: String) {
      
      // Set the frame for the label
      let frame: Rect = Rect(x: 24, y: 14, w: self.frame.w - 48, h: 20)
      // Create the label
      let label: UILabel = UILabel(frame: frame, font: Fonts.Regular.fourteen, align: .Left, color: .white)
      // Set the text for the label
      label.text = title
      // Add the label to the view
      self.addSubview(label)
      
   }
   
}
