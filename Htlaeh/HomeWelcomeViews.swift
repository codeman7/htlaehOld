//
//  HomeWelcomeViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/4/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This struct is used to create all the views when a new user downloads the app.
   It will create all the views and return them to the "Home" VC.
   It also should handle the steps in navigating through the walk through for the Home VC
 */
struct HomeWelcomeViews {
   
   /**
      Create the messages for the welcome screen
      - parameter controllerView: The view for the controller access it with self.view
      - returns: The views that need to be added to the array
   */
   func createMessages(controllerView view: UIView) -> [UIView] {
      
      var views: [UIView] = []
      // Create the message label and it's Y Position
      let message: (UIView, CGFloat) = self.createMessage(controllerView: view)
      views += [message.0] // Add the message view to the array
      // Create the big label
      let bigLabel: UIView = self.createBigLabel(controllerView: view, messageTop: message.1)
      // Add the big label to the array
      views += [bigLabel]
      // Return the array
      return views
      
   }
   
   private func createBigLabel(controllerView view: UIView, messageTop: CGFloat) -> UIView {
      
      let yPos: CGFloat = messageTop - 64
      let frame: CGRect = CGRect(x: view.frame.width / 2 - 100, y: yPos, width: 200, height: 48)
      let big: HomeBigLabel = HomeBigLabel()
      let label: UILabel = UILabel(frame: frame, properties: big)
      label.text = "Welcome"
      return label
      
   }
   
   private func createMessage(controllerView view: UIView) -> (view: UIView, messageTop: CGFloat) {
      
      let message: String = "We are glad to have you here! Walk through how to use \"Htlaeh\" or tap \"Tips\" in Settings when you want a refresher later."
      let height: CGFloat = message.heightWithConstrainedWidth(240, font: Fonts.Medium().sixteen)
      let yPos: CGFloat = view.frame.height / 2 - (height / 2)
      let frame: CGRect = CGRect(x: view.frame.width / 2 - 120, y: yPos, width: 240, height: height)
      let homeMessage: HomeMessage = HomeMessage()
      let label: UILabel = UILabel(frame: frame, properties: homeMessage)
      label.text = message
      label.multipleLines()
      return (view: label, messageTop: yPos)
      
   }
   
   func createButtons(controllerView view: UIView, controller: Home) -> [UIView] {
      // Create the Show buttons frame
      let showFrame: CGRect = CGRect(x: view.frame.width - 140, y: view.frame.height - 56, width: 124, height: 40)
      // Create the show button
      let showButton: Button = Button(frame: showFrame, type: .Raised)
      // Set the show buttons title
      showButton.addTitle("SHOW ME", color: Color().white)
      // Set the show buttons background color
      showButton.backgroundColor = Color().blue
      // Set the action for the show button
      showButton.action = { controller.showTutorial() }
      
      // Create the skip "no thanks" buttons frame
      let skipFrame: CGRect = CGRect(x: showFrame.origin.x - 140, y: view.frame.height - 56, width: 124, height: 40)
      // Create teh skip "no thanks" button
      let skipButton: Button = Button(frame: skipFrame, type: .Flat)
      // Set the buttons title
      skipButton.addTitle("NO THANKS", color: Color().blue)
      // Set the action for the button
      skipButton.action = { controller.skipTutorial() }
      // Return the array of the buttons
      return [showButton, skipButton]
      
   }
   
   func hideViews(content: [UIView]) {
      
      for view in content {
         if view is Button {
            UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseInOut, animations: { view.alpha = 0.0 }, completion: nil)
         }
      }
      
   }
   
   func showViews(content: [UIView]) {
      
      for view in content {
         UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseInOut, animations: { view.alpha = 1.0 }, completion: nil)
      }
      
   }
   
}