//
//  SearchBar.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/18/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

final class SearchBar : UITextField {
   
   // MARK: Properties
   /// The property for the placeholder
   lazy var placeholderLabel: UILabel = self.createPlaceholder()
   /// The property for the clear button
   lazy var clearButton: Button = self.addClearButton()
   /// The property for the controller
   var controller: Search
   
   
   // MARK: Initializers
   init(frame: CGRect, controller: Search) {
      
      // Set the controller property
      self.controller = controller
      // Call the super initializer
      super.init(frame: frame)
      // Set up the default settings
      self.defaultSettings()
      // Add the placeholder to the view
      self.addSubview(self.placeholderLabel)
      // Add the event listener for the text field's change
      self.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   func defaultSettings() {
      
      // Set the tint color and the font for the view
      self.tintColor = .blue
      self.font = Fonts.Bold.thirtySix
      
      // Set the alignment and the delegate
      self.delegate = self
      self.textAlignment = .left
      
      // Set the return key type
      self.returnKeyType = .search
      
   }
   
   func createPlaceholder() -> UILabel {
      
      // Set the frame for the label and create it
      let frame: Rect = Rect(x: 0, y: 0, w: self.frame.w, h: 48)
      let label: UILabel = UILabel(frame: frame, font: Fonts.Bold.thirtySix, align: .left, color: .black)
      
      // Set the labels alpha and text properties
      label.alpha = 0.14
      label.text = "Search"
      
      // Return the label
      return label
      
   }
   
   fileprivate func addClearButton() -> Button {
      
      // Set the frame and the view for the button
      let frame: Rect = Rect(x: self.frame.w - 48, y: 0, w: 40, h: 40)
      let button: Button = Button(frame: frame, type: .flat)
      
      // Add the icon to the button and set it's action
      button.add(image: Images.Navigation().close, alpha: 0.87)
      button.action = { self.clear() }
      
      // Set the buttons alpha
      button.alpha = 0.0
      
      // Add the button as a subview and return it
      self.addSubview(button)
      return button
      
   }
   
   func clear() {
      // Set the text property
      self.text = ""
      // Show the placeholder
      self.placeholderLabel.showWithAlpha(0.0, alpha: 0.14)
      // Hide the clear button
      self.clearButton.hideWithAlpha()
      
   }
   
}

extension SearchBar {
   
   override func textRect(forBounds bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 8, w: self.frame.w - 48, h: 80)
   }
   
   override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return Rect(x: 0, y: 12, w: self.frame.w - 48, h: 80)
   }
   
}

extension SearchBar : UITextFieldDelegate {
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
      // Make sure text isn't nil
      guard let text = self.text else {
         return false
      }
      
      // Search for the text of the field
      self.controller.searchFor(text)
      // Return false
      return false
   }
   
   func textFieldDidChange(_ textField: UITextField) {
      // Make sure the text field isn't blank
      guard self.text != "" else {
         self.clearButton.hideWithAlpha()
         self.controller.showAll()
         self.placeholderLabel.showWithAlpha(0.0, alpha: 0.14)
         return
      }
      
      // Make sure the text field's text prop isn't nil
      guard let text = self.text else {
         return
      }
      
      self.clearButton.showWithAlpha()
      self.placeholderLabel.hideWithAlpha()
      self.controller.updateSuggestions(text)
      
   }
   
   func updateText() {
      
      if self.text != "" {
         self.clearButton.showWithAlpha()
         self.placeholderLabel.hideWithAlpha()
         self.controller.updateSuggestions(self.text!)
      } else {
         self.clearButton.hideWithAlpha()
         self.controller.showAll()
         self.placeholderLabel.showWithAlpha(0.0, alpha: 0.14)
      }
      
   }
   
}






