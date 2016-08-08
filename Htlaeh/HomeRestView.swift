//
//  HomeRestView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/3/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HomeRestViews {
   
   // Add the giant rest label
   func createBigLabel(controllerView view: UIView) -> UIView {
      
      let frame: CGRect = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 104, width: 200, height: 48)
      let bigLabel: HomeBigLabel = HomeBigLabel()
      let restLabel: UILabel = UILabel(frame: frame, properties: bigLabel)
      restLabel.text = "Rest Day"
      return restLabel
      
   }
   
   func createMessage(controllerView view: UIView) -> UIView {
      
      // Add message
      let text: String = "Did you want to see how you are doing, add a workout, or view upcoming workouts?"
      let height = text.heightWithConstrainedWidth(200, font: Fonts.Regular().sixteen)
      let messageFrame: CGRect = CGRect(x: view.frame.width / 2 - 120, y: view.frame.height / 2 - 40, width: 240, height: height)
      let homeMessage: HomeMessage = HomeMessage()
      let message: UILabel = UILabel(frame: messageFrame, properties: homeMessage)
      message.text = text
      message.multipleLines()
      return message
      
   }
   
   func createButtons(controllerView view: UIView, controller: Home) -> [UIView] {
      
      // TODO: Correct actions to be controller.action()
      var views: [UIView] = []
      let buttonSize: CGSize = CGSize(width: 124, height: 40)
      let titles: [String] = ["CALENDAR", "NEW", "SEARCH"]
      let titleColors: [UIColor] = [Color().white, Color().black, Color().white]
      let backGroundColors: [UIColor] = [Color().blue, Color().yellow, Color().red]
      let actions: [() -> ()] = [{print("Show calendar")}, {print("Show new workout")}, {print("Show search")}]
      for a in 0..<3 {
         let y = (view.frame.height - 80) - CGFloat(a * 64)
         let frame: CGRect = CGRect(x: view.frame.width / 2 - 62, y: y, width: buttonSize.width, height: buttonSize.height)
         let button: Button = Button(frame: frame, type: .Raised)
         button.addTitle(titles[a], color: titleColors[a])
         button.backgroundColor = backGroundColors[a]
         button.action = actions[a]
         views += [button]
      }
      
      return views
      
   }
   
   func addRestViewsToView(controllerView: UIView, controller: Home) {
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
      
   }
   
}






