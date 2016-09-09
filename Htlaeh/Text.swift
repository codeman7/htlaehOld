//
//  TextField.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


/**
   Use this class to create any text field in the New workout VC
 */
class Text: UITextField {
   // MARK: Properties
   /// The color for all accent elements
   private let standardColor: UIColor = UIColor.blue
   /// The color for all error elements
   private let errorColor: UIColor = UIColor.red
   /// The font for inactive state
   private let inactiveFont: UIFont = Fonts.Regular.sixteen
   /// The font for active state
   private let activeFont: UIFont = Fonts.Bold.thirtySix
   /// The font for hint active state
   private let activeHintFont: UIFont = Fonts.Regular.sixteen
   /// The font for hint in inactive state
   private let inactiveHintFont: UIFont = Fonts.Regular.twelve
   /// The placeholder and hint for the text field
   var placeholderText: String {
      didSet(newValue) {
         self.placeholderLabel.text = newValue
      }
   }
   /// The type of the field
   let type: TextFieldType
   /// The bottom line for the text field
   lazy var bottomLine: UIView = self.createBottomLine()
   /// The placeholder for the field
   lazy var placeholderLabel: UILabel = self.createPlaceholderLabel()
   /// The rect for editing and text bounds
   private var textBounds: Rect {
      return Rect(x: 0, y: 7, w: self.frame.w, h: 48)
   }
   
   // MARK: Initializers
   /// Default initalizer
   init<A: TextFieldOptions>(frame: CGRect, options: A) {
      // Set the placeholder text value
      self.placeholderText = options.placeHolderText
      // Set the type of the text field
      self.type = options.type
      // Call the super initalizer
      super.init(frame: frame)
      // Update settings based on type
      self.styleType()
      // Set the delgate for the text field
      self.delegate = self
      // Set the background color
      self.backgroundColor = .clearColor()
      // Set the font for the text field
      self.font = self.activeFont
      // Layout all the views
      self.layoutViews()
      // Add the did change method listener
      self.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: .EditingChanged)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class doesn't support NSCoding")
   }
   
   private func updatePlaceholder() {
      self.placeholderLabel.frame.origin.y = 86.0
   }
   
   // MARK: Functions
   private func layoutViews() {
      
      // Add the placeholder text to the text field
      self.addSubview(self.placeholderLabel)
      // Add the bottom line to the text field
      self.addSubview(self.bottomLine)
      
   }
   
   private func styleType() {
      if self.type == .all {
         self.returnKeyType = .Next
         self.autocorrectionType = .No
      } else {
         self.keyboardType = .NumberPad
         self.textAlignment = .Right
      }
   }
   
   private func createBottomLine() -> UIView {
      // Create the frame for the bottom line
      let bottomLineFrame: Rect = Rect(x: 0, y: 39 , w: self.frame.w, h: 1)
      // Create the bottom line
      let botttomLine: Line = Line(frame: bottomLineFrame, alpha: 0.38)
      // Return the bottom line
      return botttomLine
      
   }
   
   private func createPlaceholderLabel() -> UILabel {
      
      // Create the frame for the placeholder text
      let placeholderFrame: CGRect = CGRect(x: 0, y: 16, width: self.frame.width, height: 19)
      // Set the alignment for the placeholder label
      let alignment: NSTextAlignment = (self.type == .number) ? .Right : .Left
      // Create the placeholder text
      let placeHolder: UILabel = UILabel(frame: placeholderFrame, font: self.inactiveFont, align: alignment, color: .black)
      // Set the alpha for the placeholder
      placeHolder.alpha = 0.38
      // Set the text for the placeholder
      placeHolder.text = self.placeholderText
      // Return the placeholder
      return placeHolder
      
   }
   
   /**
      This function updates the style for the text field
      - parameter state: The state that the text field is current
   */
   /*private func updateStyle(state: TextFieldState) {
      
      switch state {
      case .Active:
         self.activeStyle()
      case .InactiveBlank:
         print("Update inactive blank for state & style changes")
      case .InactiveText:
         self.inactiveText()
      }
      
   }*/
   
   /**
      This function is for when a text field is in an active state and needs to be style accordingly
   */
   private func activeStyle() {
      
      // Create the animation
      let animate: () -> () = {
         self.placeholderLabel.font = self.activeHintFont
         self.placeholderLabel.frame.origin.y = 0
         self.placeholderLabel.textColor = self.standardColor
         self.placeholderLabel.alpha = 1.0
         self.bottomLine.backgroundColor = self.standardColor
         self.bottomLine.frame.origin.y = 82
         self.bottomLine.alpha = 1.0
      }
      // Animate the view
      UIView.animateWithDuration(0.3, animations: animate)
      
   }
   
   private func inactiveText() {
      
      // Create animation
      let animate: () -> () = {
         self.placeholderLabel.frame.origin.y = 16
         self.placeholderLabel.font = self.inactiveFont
         self.placeholderLabel.alpha = 0.38
         self.placeholderLabel.textColor = .black
         self.bottomLine.frame.origin.y = 39
         self.bottomLine.alpha = 0.38
         self.bottomLine.backgroundColor = .black
      }
      // Animate the view
      UIView.animateWithDuration(0.3, animations: animate)
      
   }
   
   private func errorActiveStyle() {
      
      // Create the animation
      let animate: () -> () = {
         
      }
      // Animate the view
      UIView.animateWithDuration(0.3, animations: animate)
      
   }
   
}

// MARK: Methods for text placement
extension Text {
   
   override func editingRectForBounds(bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 27, w: self.frame.w, h: 56)

   }
   
   override func textRectForBounds(bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 7, w: self.frame.w, h: 48)

   }
   
}

// MARK: All delegate methods
extension Text : UITextFieldDelegate {
   
   /**
    This function handles when the text field begins editing
   */
   func textFieldDidBeginEditing(textField: UITextField) {
      self.superview?.bringSubviewToFront(self)
      //self.updateStyle(.Active)
   
   }
   
   /**
     This function handles when the text field finishes editing
   */
   func textFieldDidEndEditing(textField: UITextField) {
      print("I finished editing")
      if self.text != nil || self.text != "" {
         //self.updateStyle(.InactiveText)
      } else {
         //self.updateStyle(.InactiveBlank)
      }
   }
   
   /**
      This function handles when the text field changes
   */
   func textFieldDidChange(textField: Text) {
      print("I changed")
      print("Text = \(self.text)")
   }
   
}






