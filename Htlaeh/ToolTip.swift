//
//  ToolTip.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/16/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used for the tool tip
   - Background color should ways be Grey 700
   - Alpha should always be 90%
   - Font should always be Medium 14
   - Padding left and right of text should be 16pt
   - Height should be 32
 */
class ToolTip: UIView {
   // MARK: Properties
   
   // MARK: Initializers
   /**
    Default initializer
    - parameter frame: The frame that the view will have
    - parameter text: The text that the view will have
   */
   init(origin: CGPoint, text: String) {
      // Set the width for the view
      let width: CGFloat = text.widthWithConstrainedHeight(16.0, font: Fonts.Medium.fourteen) + 32
      // Set the frame for the view
      let frame: Rect = Rect(origin: origin, size: CGSize(width: width, height: 32))
      // Call the super initializer
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = .grey700
      // Set the alpha
      self.alpha = 0.90
      // Round the edges of the tool tip
      self.layer.cornerRadius = 2.0
      // Add the label
      self.addLabelWith(text)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      Adds the label to the view
      - parameter text: The text property for the label
   */
   private func addLabelWith(text: String) {
      
      // Create the frame for the view
      let frame: Rect = Rect(x: 16, y: 8, w: self.frame.w - 32, h: 16)
      // Create the label
      let label: UILabel = UILabel(frame: frame, font: Fonts.Medium.fourteen, align: .Center, color: .white)
      // Set the text property for the label
      label.text = text
      // Add the label to the view
      self.addSubview(label)
      
   }
   
   
}
