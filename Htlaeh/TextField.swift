//
//  TextField.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/9/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used for the text fields within New Workout
   Default text field
   
   STANDARD FONT is Medium 24 black with 87% opacity
 
   HINT Should be 38% opacity
 
   BOTTOM CHAR COUNTER / ERROR MESSAGE FONT is Regular 14
 
   FLOATING LABEL FONT is Regular 16
 
   FLOATING LABEL WITH CHAR/ERROR Standard height is 83, 19 for floating label, 8 spacing, 28 for text, 7 space, 1 line, 4 space, 16 label
 
   Spacing between text fields should be a minimum of 16pt
 */
class TextField: UITextField {
   // MARK: Properties
   /// The variable that will be the placeholder label
   lazy var placeholderLabel: UILabel = self.createPlaceholder()
   /// The variable that will be the bottom line
   lazy var bottomLine: Line = self.createBottomLine()
   /// The variable that will be the error label
   lazy var errorLabel: UILabel = self.createErrorMessage()
   /// Property for all the options
   private let options: TextFieldOptions
   
   // MARK: Initializers
   /**
      Default initializer
   */
   init<A: TextFieldOptions>(frame: CGRect, options: A) {
      
      // Set the options property
      self.options = options
      // Call the super intializer
      super.init(frame: frame)
      // Set the default values
      self.defaultSettings()
      // Add the event listener for the text field changing
      self.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: .EditingChanged)
      // Layout the subviews
      self.layoutViews()
      
   }
   
   /// Requied By Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      Sets the default values for the view
   */
   func defaultSettings() {
      
      // Set the tint color for the view
      self.tintColor = Color().blue
      // Set the font for the view
      self.font = Fonts.Medium().twentyFour
      // Set the alignment
      self.textAlignment = self.options.style.alignment
      // Set the delegate to self
      self.delegate = self
      // Set the keyboard type
      self.keyboardType = self.options.style.keyboardType
      // Set the return key type
      if self.options.style.returnKey != nil { self.returnKeyType = self.options.style.returnKey! }
      // Set the auto correct type
      if self.options.style.autoCorrection != nil { self.autocorrectionType = self.options.style.autoCorrection! }
      
   }
   
   /**
      This function is in charge of laying out all the subviews of the text field
   */
   func layoutViews() {
      
      // Add the placeholder to the view
      self.addSubview(self.placeholderLabel)
      // Add the bottom line to the view
      self.addSubview(self.bottomLine)
      
   }
   
   /**
     This method styles the keyboard on any state change
   */
   func style(state: TextFieldState) {
      // Create the animation
      let animate: () -> () = {
         self.placeholderLabel.font = state.placeholderFont
         self.placeholderLabel.alpha = state.placeholderAlpha
         self.placeholderLabel.textColor = state.placeholderColor
         self.placeholderLabel.frame.origin.y = state.placeholderY
         self.bottomLine.alpha = state.bottomLineAlpha
         self.bottomLine.backgroundColor = state.bottomLineColor
         self.errorLabel.alpha = state.errorAlpha
      }
      // Animate the view
      UIView.animateWithDuration(0.3, animations: animate)
      
   }
   
   /**
      Adds the error message to the view
      - parameter text: The text for the error message
   */
   func showErrorMessage(text: String) {
      
      // Set the text for the error label
      self.errorLabel.text = text
      // Add the error message to the view
      self.addSubview(errorLabel)
      
   }
   
   // MARK: Functions for creating lazy views
   /**
      This function creates the error label
   */
   private func createErrorMessage() -> UILabel {
      // Set the error messages frame
      let frame: Rect = Rect(x: 0, y: 67, w: self.frame.w, h: 16)
      // Create and return the error message label
      return UILabel(frame: frame, font: Fonts.Regular().fourteen, align: self.options.style.alignment, color: Color().red)
      
   }
   
   /**
      This function creates the placeholder label
   */
   private func createPlaceholder() -> UILabel {
      
      // Set the placeholders frame
      let frame: Rect = Rect(x: 0, y: 27, w: self.frame.w, h: 28)
      // Create the placeholder
      let placeholder: UILabel = UILabel(frame: frame, font: TextFieldState.start.placeholderFont, align: self.options.style.alignment, color: TextFieldState.start.placeholderColor)
      // Set the placeholders text
      placeholder.text = self.options.placeHolderText
      // Set the placeholders opacity
      placeholder.alpha = TextFieldState.start.placeholderAlpha
      // Return the placeholder
      return placeholder
      
   }
   
   /**
      This function creates the bottom line
   */
   private func createBottomLine() -> Line {
      
      // Set the lines frame
      let frame: Rect = Rect(x: 0, y: 62, w: self.frame.w, h: 1)
      // Create and return the line
      return Line(frame: frame, alpha: TextFieldState.start.bottomLineAlpha)
      
   }
   
   
}

// MARK: Methods for text bounds
extension TextField {
   
   override func textRectForBounds(bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 31, w: self.frame.w, h: 40)
   }
   
   override func editingRectForBounds(bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 31, w: self.frame.w, h: 40)
   }
   
}

// MARK: Delegate conformance
extension TextField : UITextFieldDelegate {
   
   /**
      This method handles when the text field ends ending
   */
   func textFieldDidEndEditing(textField: UITextField) {
      // Validate the text field
      self.isValid()
   }
   
   /**
      This method handles when the text field starts ending
   */
   func textFieldDidBeginEditing(textField: UITextField) {
      // Set the style for the view
      self.style(.active)
   }
   
   /**
     This method handles when the text field changes its text value
   */
   func textFieldDidChange(textField: UITextField) {
      
      if self.placeholderLabel.text == "Rest" {
         self.updateTimeFieldText()
      }
      // TODO: Update the text field to update as user types
      print("Text field changed")
      
   }
   
   /// This method tell the text field it can't return
   func textFieldShouldReturn(textField: UITextField) -> Bool {
      return false
   }
   
}

// MARK: Validation methods
extension TextField {
   
   /**
     This method calls the correct validation methods for the corresponding text field
      - returns: True if everything is good and false if an error has occured
   */
   func isValid() -> Bool {
      // Check the type of the field
      switch self.options.type {
      case .Number:
         // Must be a time type so validate accordingly
         return self.validateTimeField()
      case .Time:
         // If the type is number then validate it based on numbers
         return self.validateNumberField()
      case .All:
         // The text field is of string type of validate accordingly
         return self.validateStringField()
      }
   }
   
   /**
      This method validates number fields
      - returns: True if everything is good and false if an error occured
   */
   func validateNumberField() -> Bool {
      
      return self.numberCheck()
      
   }
   
   /// Use this function to validate a time field
   func validateTimeField() -> Bool {
      
      guard self.notBlank() == true else {
         return false
      }
      guard self.numberCheck() == true else {
         return false
      }
      return true
      
   }
   
   /// Use this function to set time fields text
   func updateTimeFieldText() {
      
      let value: Double = self.toDouble()
      let newText: String = value.convertToTime()
      self.text = newText
      
   }
   
   /// Use this function to convert a field to double
   func toDouble() -> Double {
      
      let textWithoutLetters: String = String(self.text!.characters.filter { String($0).rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "0123456789")) != nil })
      return Double(textWithoutLetters)!
      
   }
   
   /// This method check to see if there are numbers only in the text field
   func numberCheck() -> Bool {
      // Make sure text isn't nil
      guard let value = self.text else {
         // Style the text field accordingly
         self.style(.required)
         self.showErrorMessage("Required")
         // Style the text field
         return false
      }
      // Make sure not blank
      guard value != "" else {
         // Style the text field accordingly
         self.style(.required)
         self.showErrorMessage("Required")
         return false
      }
      
      let canBeInt: Bool = Int(value) != nil
      // Check if it can be an Int or not and then style
      (canBeInt == true) ? self.style(.nonActiveGood) : self.style(.nonActiveError); self.showErrorMessage("Numbers only")
      // If value can be cast to Int then good
      return canBeInt
   }
   
   /// This method makes sure the text field isn't blank
   func notBlank() -> Bool {
      // Make sure value isn't nil
      guard self.text != nil else {
         // Style the text field
         self.style(.required)
         self.showErrorMessage("Required")
         return false
      }
      // Make sure value isn't empty
      guard self.text != "" else {
         // Style the text field
         self.showErrorMessage("Required")
         self.style(.required)
         return false
      }
      // Style the text field
      self.style(.nonActiveGood)
      // Everything is good return true
      return true
   }
   
   /**
      This method validates string fields
      - returns: True if everything is good and false if an error occured
   */
   func validateStringField() -> Bool {
      // Make sure the text field ins't nil or blank
      return self.notBlank()
      
   }
   
}






