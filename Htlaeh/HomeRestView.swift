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
      let restLabel: UILabel = UILabel(frame: frame, properties: HomeContentLabel())
      restLabel.text = "Rest Day"
      restLabel.font = Fonts.Bold().thirtySix
      return restLabel
      
   }
   
   func createMessage(controllerView view: UIView) -> UIView {
      
      // Add message
      let text: String = "Did you want to see how you are doing, add a workout, or view upcoming workouts?"
      let height = text.heightWithConstrainedWidth(200, font: Fonts.Regular().sixteen)
      let messageFrame: CGRect = CGRect(x: view.frame.width / 2 - 120, y: view.frame.height / 2 - 40, width: 240, height: height)
      let config: LabelConfig = LabelConfig(frame: messageFrame, font: Fonts.Regular().sixteen, alignment: .Center, color: Color().black)
      let message: UILabel = UILabel(config: config)
      message.text = text
      message.numberOfLines = 0
      message.lineBreakMode = .ByWordWrapping
      message.alpha = 0.54
      return message
      
   }
   
   func createButtons(controllerView view: UIView, controller: UIViewController) -> [UIView] {
      
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
   
}