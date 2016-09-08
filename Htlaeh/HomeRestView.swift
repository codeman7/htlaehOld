//
//  HomeRestView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/3/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HomeRestViews : ViewsStruct {
   
   /// The view controller that will hold all the views
   let controller: Home
   /// The views that will need to be updated according to their corresponding delay
   var views: [UIView: (delay: Double, alpha: CGFloat)] = [:]
   
   /// Default and only initializer
   init(controller: Home) {
      // Set the controller property
      self.controller = controller
   }
   
   init<T : Controller>(controller: T) {
      self.controller = controller as! Home
   }
   
   /**
      This function lays out the views and sets the alpha and delay properties to show them later
   */
   mutating func layoutViews() {
      
      // Create the header and lay it out
      let header: BoldHeader = self.controller.header
      self.controller.view.addSubview(header)
      // Set the controllers alpha
      header.alpha = 0.0
      // Set the headers delay to 0
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Create the big label and it to the controller
      let bigLabel: UILabel = self.createBigLabel()
      self.controller.view.addSubview(bigLabel)
      
      // Set the controllers alpha and add it to the views array
      bigLabel.alpha = 0.0
      self.views[bigLabel] = (delay: 0.025, alpha: HomeLabel.bigLabel.alpha)
      
      // Create the message and it to the controller
      let message: UILabel = self.createMessage()
      self.controller.view.addSubview(message)
      
      // Set the controller's alpha and add it to the views array
      message.alpha = 0.0
      self.views[message] = (delay: 0.050, alpha: HomeLabel.message.alpha)
      
      // Create all the buttons
      let buttons: [Button] = self.createButtons()
      // Iterate over the buttons and add them to the controller, set their alpha and add them ot the views array
      for iteration in 0..<buttons.count {
         self.controller.view.addSubview(buttons[iteration])
         buttons[iteration].alpha = 0.0
         self.views[buttons[iteration]] = (delay: (0.05 + Double(iteration) * 0.025), alpha: 1.0)
      }
      
   }
   
   // Add the giant rest label
   fileprivate func createBigLabel() -> UILabel {
      
      let frame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 100, y: self.controller.view.frame.height / 2 - 104, width: 200, height: 48)
      let restLabel: UILabel = UILabel(frame: frame, properties: HomeLabel.bigLabel)
      restLabel.text = "Rest Day"
      return restLabel
      
   }
   
   fileprivate func createMessage() -> UILabel {
      
      // Add message
      let text: String = "Did you want to see how you are doing, add a workout, or view upcoming workouts?"
      let height = text.heightWithConstrainedWidth(200, font: Fonts.Regular.sixteen)
      let messageFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 120, y: self.controller.view.frame.height / 2 - 40, width: 240, height: height)
      let message: UILabel = UILabel(frame: messageFrame, properties: HomeLabel.message)
      message.text = text
      message.multipleLines()
      return message
      
   }
   
   fileprivate func createButtons() -> [Button] {
      
      // TODO: Correct actions to be controller.action()
      var views: [Button] = []
      let buttonSize: CGSize = CGSize(width: 124, height: 40)
      let titles: [String] = ["NEW", "SEARCH"]
      let titleColors: [UIColor] = [.white, .white]
      let backGroundColors: [UIColor] = [.blue, .red]
      let actions: [() -> ()] = [{ self.controller.restToNewWorkout() }, { self.controller.restToSearch() }]
      for a in 0..<2 {
         let y = (self.controller.view.frame.height - 80) - CGFloat(a * 64)
         let frame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 62, y: y, width: buttonSize.width, height: buttonSize.height)
         let button: Button = Button(frame: frame, type: .raised)
         button.set(title: titles[a], color: titleColors[a])
         button.backgroundColor = backGroundColors[a]
         button.action = actions[a]
         views += [button]
      }
      
      return views
      
   }
   
   /*func addRestViewsToView(controllerView: UIView, controller: Home) {
      // An array to hold all the alphas
      var alphas: [CGFloat] = []
      // Get all the elements that will be on screen
      let bigLabel: UIView = self.createBigLabel(controllerView: controllerView)
      let message: UIView = self.createMessage(controllerView: controllerView)
      let buttons: [UIView] = self.createButtons(controllerView: controllerView, controller: controller)
      // Place all the views into an array
      let views: [UIView] = [bigLabel, message] + buttons
      // Add all the alphas to the array
      alphas += [bigLabel.alpha, message.alpha]
      // Iterate over the buttons to add their alphas
      for button in buttons { alphas += [button.alpha] }
      // Iterate over the views
      for iteration in 0..<views.count {
         // Set the views alpha to 0
         views[iteration].alpha = 0.0
         // Add the views to the controller VC
         controllerView.addSubview(views[iteration])
         // Set the views alpha to the correct alpha
         UIView.animateWithDuration(0.3, delay: 0.3, options: .CurveEaseInOut, animations: { views[iteration].alpha = alphas[iteration] }, completion: nil)
      }
      
   }*/
   
}







