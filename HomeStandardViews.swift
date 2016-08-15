//
//  HomeStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/4/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HomeStandardViews {
   
   func addBottomButtons(controllerView view: UIView, controller: Home) -> [UIView] {
      
      var buttons: [UIView] = []
      let xLeft: CGFloat = view.frame.width.halfCentered(side: .Left, size: 124)
      let leftButtonFrame: CGRect = CGRect(x: xLeft, y: view.frame.height - 88, width: 124, height: 40)
      let leftButton: Button = Button(frame: leftButtonFrame, type: .Raised)
      leftButton.action = { controller.skipSet() }
      leftButton.backgroundColor = Color().red
      leftButton.add(title: "SKIP", color: Color().white)
      buttons += [leftButton]
      
      let xRight: CGFloat = view.frame.width.halfCentered(side: .Right, size: 124)
      let rightButtonFrame: CGRect = CGRect(x: xRight, y: view.frame.height - 88, width: 124, height: 40)
      let rightButton: Button = Button(frame: rightButtonFrame, type: .Raised)
      rightButton.action = { controller.setDone() }
      rightButton.backgroundColor = Color().blue
      rightButton.add(title: "DONE", color: Color().white)
      buttons += [rightButton]
      return buttons
      
   }
   
   func addLabels(controllerView view: UIView, controller: Home) -> [UIView] {
      
      var labels: [UIView] = []
      let homeHint: HomeHint = HomeHint()
      let homeContent: HomeContentLabel = HomeContentLabel()
      let homeAccent: HomeAccent = HomeAccent()
      let exerciseHintFrame: CGRect = CGRect(x: view.frame.width / 2 - 80, y: view.frame.height / 2 - 134, width: 160, height: 19)
      let exerciseHintLabel: UILabel = UILabel(frame: exerciseHintFrame, properties: homeHint)
      exerciseHintLabel.text = "Exercise Name"
      labels += [exerciseHintLabel]
      
      let exerciseFrame: CGRect = CGRect(x: view.frame.width / 2 - 80, y: view.frame.height / 2 - 107, width: 160, height: 48)
      let exerciseLabel: UILabel = UILabel(frame: exerciseFrame, properties: homeContent)
      exerciseLabel.text = "\(controller.workout!.sets[0].name)"
      labels += [exerciseLabel]
      
      let repsX: CGFloat = view.frame.width.halfCentered(side: .Left, size: 136)
      let repsHintFrame: CGRect = CGRect(x: repsX, y: view.frame.height / 2 - 51, width: 136, height: 19)
      let repsHint: UILabel = UILabel(frame: repsHintFrame, properties: homeHint)
      repsHint.text = "Reps"
      labels += [repsHint]
      
      let repsFrame: CGRect = CGRect(x: repsX, y: view.frame.height / 2 - 24, width: 136, height: 48)
      let repsLabel: UILabel = UILabel(frame: repsFrame, properties: homeContent)
      repsLabel.text = "\(controller.workout!.sets[0].reps!)"
      labels += [repsLabel]
      
      let weightX: CGFloat = view.frame.width.halfCentered(side: .Right, size: 136)
      let weightHintFrame: CGRect = CGRect(x: weightX, y: view.frame.height / 2 - 51, width: 136, height: 19)
      let weightHint: UILabel = UILabel(frame: weightHintFrame, properties: homeHint)
      weightHint.text = "Weight"
      labels += [weightHint]
      
      let weightFrame: CGRect = CGRect(x: weightX, y: view.frame.height / 2 - 24, width: 136, height: 48)
      let weightLabel: UILabel = UILabel(frame: weightFrame, properties: homeContent)
      weightLabel.text = "\(Int(controller.workout!.sets[0].weight!))"
      labels += [weightLabel]
      
      let restHintFrame: CGRect = CGRect(x: view.frame.width / 2 - 68, y: view.frame.height / 3 * 2 , width: 136, height: 16)
      let restHint: UILabel = UILabel(frame: restHintFrame, properties: homeHint)
      restHint.text = "Rest"
      labels += [restHint]
      
      let restFrame: CGRect = CGRect(x: view.frame.width / 2 - 68, y: view.frame.height / 3 * 2 + 20, width: 136, height: 32)
      let restLabel: UILabel = UILabel(frame: restFrame, properties: homeAccent)
      restLabel.text = "\(controller.workout!.sets[0].restTime!.toString())"
      labels += [restLabel]
      
      return labels
      
   }
   
}






