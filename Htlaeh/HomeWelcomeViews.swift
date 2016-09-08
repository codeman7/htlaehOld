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
struct HomeWelcomeViews : ViewsStruct {
   /// The view controller that will hold the views
   let controller: Home
   /// The views that will need to be updated and their corresponding delay
   var views: [UIView: (delay: Double, alpha: CGFloat)] = [:]
   
   /// Default and only initializer
   init(controller: Home) {
      // Set the controller property
      self.controller = controller
   }
   
   init<T : Controller>(controller: T) {
      self.controller = controller as! Home
   }
   
   
   mutating func layoutViews() {

      let header: BoldHeader = self.controller.header
      // Add the header to the view
      self.controller.view.addSubview(header)
      // Set the header's alpha to 0
      header.alpha = 0.0
      // Set the headers delay to 0
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Get the little message
      let message: (UIView, CGFloat) = self.createMessage()
      // Add the little message to the view
      self.controller.view.addSubview(message.0)
      // Add the label and set its delay time
      self.views[message.0] = (delay: 0.05, alpha: HomeLabel.message.alpha)
      
      // Create the big label
      let bigLabel: UIView = self.createBigLabelAt(y: message.1)
      // Add the big label to the view
      self.controller.view.addSubview(bigLabel)
      // Add the big label to the views and set its delay
      self.views[bigLabel] = (delay: 0.025, alpha: HomeLabel.bigLabel.alpha)
      
      // Create buttons
      let buttons: [UIView] = self.createButtons()
      for button in buttons {
         // Add the buttons to the view
         self.controller.view.addSubview(button)
         self.views[button] = (delay: 0.075, alpha: 1.0)
      }
      
   }
  
      
   fileprivate func createBigLabelAt(y: CGFloat) -> UIView {
      
      let yPos: CGFloat = y - 64
      let frame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 100, y: yPos, width: 200, height: 48)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.bigLabel)
      label.text = "Welcome"
      // Set the labels alpha to 0
      label.alpha = 0.0
      return label
      
   }
   
   fileprivate func createMessage() -> (view: UIView, messageTop: CGFloat) {
      
      let message: String = "We are glad to have you here! Walk through how to use \"Htlaeh\" or tap \"Tips\" in Settings when you want a refresher later."
      let height: CGFloat = message.heightWithConstrainedWidth(240, font: Fonts.Medium.sixteen)
      let yPos: CGFloat = self.controller.view.frame.height / 2 - (height / 2)
      let frame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 120, y: yPos, width: 240, height: height)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.message)
      label.text = message
      label.multipleLines()
      // Set the label's alpha to 0
      label.alpha = 0.0
      return (view: label, messageTop: yPos)
      
   }
   
   fileprivate func createButtons() -> [UIView] {
      // Create the Show buttons frame
      let showFrame: CGRect = CGRect(x: self.controller.view.frame.width - 140, y: self.controller.view.frame.height - 56, width: 124, height: 40)
      // Create the show button
      let showButton: Button = Button(frame: showFrame, type: .raised)
      // Set the show buttons title
      showButton.set(title: "SHOW ME", color: .white)
      // Set the show buttons background color
      showButton.backgroundColor = .blue
      // Set the action for the show button
      showButton.action = { self.controller.showTutorial() }
      // Set the button's alpha to 0
      showButton.alpha = 0.0
      
      // Create the skip "no thanks" buttons frame
      let skipFrame: CGRect = CGRect(x: showFrame.origin.x - 140, y: self.controller.view.frame.height - 56, width: 124, height: 40)
      // Create teh skip "no thanks" button
      let skipButton: Button = Button(frame: skipFrame, type: .flat)
      // Set the buttons title
      skipButton.set(title: "NO THANKS", color: .blue)
      // Set the action for the button
      skipButton.action = {
         //controller.skipTutorial()
         skipButton.ripple(.blue)
      }
      // Set the buttons alpha to 0
      skipButton.alpha = 0.0
      // Return the array of the buttons
      return [showButton, skipButton]
      
   }
   
   func hideViews(_ content: [UIView]) {
      
      for view in content {
         if view is Button {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: { view.alpha = 0.0 }, completion: nil)
         }
      }
      
   }
   
   func showViews(_ content: [UIView]) {
      
      for view in content {
         UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions(), animations: { view.alpha = 1.0 }, completion: nil)
      }
      
   }
   
}







