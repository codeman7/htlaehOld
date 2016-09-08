//
//  SignStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/16/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this struct to layout all the views in the sign in View controller
 */
struct SignStandardViews {
   // MARK: Properties 
   let controller: Sign
   
   // MARK: Initializers
   init(controller: Sign) {
      
      // Assign the controller to the controller property
      self.controller = controller
      
   }
   
   // MARK: Functions
   func layoutViews() {
      
      // Get both buttons and add them to the view
      let sign: Button = self.controller.signButton
      self.controller.view.addSubview(sign)
      self.addSkipButton()
      
      // Add the logo
      self.addLogo()
      
      // Add the small word
      self.addSmallWord()
      
      // Add the large word
      self.addLargeWord()
      
   }
   
   func createSignButton() -> Button {
      
      // Create frame for the button
      let frame: Rect = Rect(x: self.controller.width / 2 - 76, y: self.controller.height - 76, w: 152, h: 40)
      // Create button
      let button: Button = Button(frame: frame, type: .flat)
      // Set action and title for button
      button.set(title: "SIGN IN / SIGN UP", color: .blue)
      button.action = { self.controller.digitsSignIn() }
      // Return button
      return button
      
   }
   
   fileprivate func addSkipButton() {
      
      // Add the skip button
      let skipButtonFrame: CGRect = CGRect(x: self.controller.width - 88, y: 40, width: 72, height: 40)
      let skipButton = Button(frame: skipButtonFrame, type: .flat)
      skipButton.set(title: "SKIP", color: .red)
      skipButton.action = { self.controller.skipSignIn() }
      self.controller.view.addSubview(skipButton)
      
   }
   
   fileprivate func addLogo() {
      
      // Add the logo
      let logo: Logo = Logo(point: CGPoint(x: self.controller.width / 2 - 60, y: 96))
      self.controller.view.addSubview(logo)
      
   }
   
   fileprivate func addSmallWord() {
      
      // Add the welcome message
      let welcomeFrame: CGRect = CGRect(x: self.controller.width / 2 - 55, y: 232, width: 110, height: 16)
      let welcomeConfig: LabelConfig = LabelConfig(frame: welcomeFrame, font: Fonts.Bold.twelve, alignment: .left, color: .black)
      let welcomeMessage: UILabel = UILabel(config: welcomeConfig)
      welcomeMessage.alpha = 0.54
      welcomeMessage.text = "Welcome to,"
      self.controller.view.addSubview(welcomeMessage)
      
   }
   
   fileprivate func addLargeWord() {
      
      // Add the big text
      let htlaehTextFrame: CGRect = CGRect(x: self.controller.width / 2 - 55, y: 248, width: 110, height: 48)
      let htlaehTextConfig: LabelConfig = LabelConfig(frame: htlaehTextFrame, font: Fonts.Bold.thirtySix, alignment: .left, color: .black)
      let htlaehText: UILabel = UILabel(config: htlaehTextConfig)
      htlaehText.alpha = 0.87
      htlaehText.text = "Htlaeh"
      self.controller.view.addSubview(htlaehText)
      
   }
   
   func createToolTip() {
      
      // Set the frame and create the tool tip
      let width: CGFloat = "Setting up account".widthWithConstrainedHeight(16.0, font: Fonts.Medium.fourteen) + 32
      let origin: CGPoint = CGPoint(x: self.controller.width / 2 - (width / 2), y: self.controller.height - 124)
      let toolTip: ToolTip = ToolTip(origin: origin, text: "Setting up account")
      
      // Add the tool tip to the view and show it
      self.controller.view.addSubview(toolTip)
      toolTip.showWithAlpha()
      
   }
   
}
