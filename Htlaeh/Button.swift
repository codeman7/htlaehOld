//
//  MDButton.swift
//  Htlaeh
//
//  Created by Cody Weaver on 3/28/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit


/**
 This enum is for all the different kinds of buttons
 */
enum ButtonType {
   
   case flat, raised, fab
   
}

/**
  Represents a button within the app
*/
class Button: UIView {
   // MARK: Properties
   /// The type of the button either Flat, FAB, or Raised
   var type: ButtonType {
     
      didSet(type) {
      
         setType(type)
      
      }
   
   }
   
   // Action to call when button is pressed
   var action: () -> () = { print("Please set the action for the button") }
   
   var icon: Icon? = nil
   
   lazy var label: UILabel = self.createLabel()
   
   /*
    // MARK: Initializers
   /**
    Default initializer
    - parameter frame: The frame for the button
    - parameter type: The type of the button
    - parameter action: The action for the button on a touch
    */
   init(frame: CGRect, type: ButtonType, action: () -> ()) {
      
      // Set the type of the button
      self.type = type
      // Set the action for the button
      self.action = action
      // Call the super initalizer
      super.init(frame: frame)
      // Set the type for the button
      // Have to call it after the frame has been set
      self.setType(self.type)
      
   }*/
   
   /**
    Default initializer
    - parameter frame: The frame for the button
    - parameter type: The type of the button
    - parameter action: The action for the button on a touch
    */
   init(frame: CGRect, type: ButtonType) {
      
      // Set the type of the button
      self.type = type
      // Call the super initalizer
      super.init(frame: frame)
      // Set the type for the button
      // Have to call it after the frame has been set
      self.setType(self.type)
      
   }
   
   
   /// Required By Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
    // MARK: Style Functions
    func setType(_ type: ButtonType) {
      
      switch self.type {
      case .raised:
         // Elevate the view
         self.elevate(1)
         // Set the corner radius for the button
         self.layer.cornerRadius = 2.0
      case .fab:
         // Elevate the view
         self.elevate(3)
         // Make the view into a circle
         self.layer.cornerRadius = self.frame.width / 2
         // Make sure height and width are the same
         guard self.frame.width == self.frame.height else { fatalError("FAB must have equal height and width") }
      default:
         // The view must be a Flat button so skip
         break
      }
    
   }
   
   fileprivate func createLabel() -> UILabel {
      
      let label: UILabel = UILabel(frame: Rect.zero, font: .medium14, align: .center, color: .black)
      self.addSubview(label)
      return label
      
   }
   
   func set(title text: String, color: UIColor) {
      
      let title: String = text.uppercased()
      let width: CGFloat = title.widthWithConstrainedHeight(22.0, font: .medium14)
      self.label.frame = Rect(x: (self.frame.w - width) / 2, y: self.frame.height / 2 - 11, w: width, h: 22)
      self.label.text = title
      self.label.textColor = color
      if color == UIColor.black {
         self.label.alpha = 0.87
      }
      
   }
   
   /**
      This method adds an icon to the button that will be 24x24pt at the center of the button
      -parameter image:   Should be the image that the icon is
      -parameter color:   The color that the image will be
   */
   func add(image: UIImage, color: UIColor) {
   
      let frame: CGRect = CGRect(x: self.frame.size.width / 2 - 12, y: self.frame.size.height / 2 - 12, width: 24, height: 24)
      icon = Icon(frame: frame, image: image, color: color)
      self.addSubview(icon!)
      
   }
   
   /**
      This method adds an icon to the button that will be black and 24x24pt at the center of the button
      - parameter image: Should be the image that the icon is
      - parameter alpha: The alpha for the icon
   */
   func add(image: UIImage, alpha: CGFloat) {
      // Set the frame for the icon
      let frame: Rect = Rect(x: self.frame.w / 2 - 12, y: self.frame.h / 2 - 12, w: 24, h: 24)
      // Create the icon
      self.icon = Icon(frame: frame, image: image, alpha: alpha)
      // Add the icon to the view
      self.addSubview(self.icon!)
      
   }
   
   /**
    This method adds a small icon 20x20 dp in the center of the button
    - parameter image:   Should be the image that the icon is
    - parameter color:   Should be the color of that image
   */
   func add(smallIcon image: UIImage, color: UIColor) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 - 10, y: self.frame.height / 2 - 10, width: 20, height: 20)
      icon = Icon(frame: frame, image: image, color: color)
      self.addSubview(icon!)
      
   }
    
    // MARK: Logic Functions
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
      super.touchesBegan(touches, with: event)
      switch self.type {
      
      case .raised:
      
         self.elevate(4)
        
      case .fab:
      
         self.elevate(6)
        
      default:
      
         break
        
      }
    
   }
    
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
   
      super.touchesEnded(touches, with: event)
      switch self.type {
      
      case .raised:
      
         self.elevate(1)
        
      case .fab:
      
         self.elevate(3)
        
      default:
      
         break
        
      }
      
      self.action()
      
   }
    
}

// MARK: Make button conform to touchable protocol
extension Button : Touchable { }

// MARK: Extension for FAB animation
extension Button {
   
   fileprivate func showFAB() {
      
      guard self.type == .fab else {
         return
      }
      
      UIView.animate(withDuration: 0.15, animations: {
         self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
         }, completion: { Bool in self.elevate(6.0) })
      
   }
   
   func updateFAB(_ color: UIColor, image: UIImage) {
      
      UIView.animate(withDuration: 0.15, delay: 0.0, options: UIViewAnimationOptions(), animations: {
         self.transform = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)
         }, completion: { Bool in
            self.elevate(0.0)
            self.backgroundColor = color
            self.icon?.image = image
            self.icon?.color = .white
            self.showFAB()
      })
      
   }
   
}





