//
//  HomeStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/4/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HomeStandardViews : ViewsStruct {
   
   /// The view controller that will hold all the views
   let controller: Home
   /// The views that will need to be updated according to their corresponding delay
   var views: [UIView: (delay: Double, alpha: CGFloat)] = [:]
   
   /// Default and only initialziers
   init(controller: Home) {
      // Set the controller property
      self.controller = controller
   }
   
   init<T : Controller>(controller: T) {
      self.controller = controller as! Home
   }
   
   /**
      This function layouts out all the views with the alpha being 0 and sets the delay to reveal them
   */
   mutating func layoutViews() {
      
      // Create the header and lay it out
      let header: BoldHeader = self.controller.header
      self.controller.view.addSubview(header)
      // Set the headers alpha and add the date to it
      header.alpha = 0.0
      header.addDate()
      
      // Set the headers delay to 0
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Get the exercise labels
      let labels: [UILabel] = self.createLabels()
      // Iterate over the exercise labels and add them to the view, set their alpha and add them to the view property
      for label in labels {
         label.alpha = 0.0
         self.controller.view.addSubview(label)
      }
      
      // Get the buttons
      let buttons: [Button] = self.createButtons()
      // Iterate over the buttons and set their alpha, add them to the view, and them to the view property
      for button in buttons {
         button.alpha = 0.0
         self.controller.view.addSubview(button)
         self.views[button] = (delay: 0.1, alpha: 1.0)
      }
      
      
      
   }
   
   private func createButtons() -> [Button] {
      
      var buttons: [Button] = []
      let xLeft: CGFloat = self.controller.view.frame.width.halfCentered(side: .Left, size: 124)
      let leftButtonFrame: CGRect = CGRect(x: xLeft, y: self.controller.view.frame.height - 88, width: 124, height: 40)
      let leftButton: Button = Button(frame: leftButtonFrame, type: .Raised)
      leftButton.action = { self.controller.skipSet() }
      leftButton.backgroundColor = Color().red
      leftButton.add(title: "SKIP", color: Color().white)
      buttons += [leftButton]
      
      let xRight: CGFloat = self.controller.view.frame.width.halfCentered(side: .Right, size: 124)
      let rightButtonFrame: CGRect = CGRect(x: xRight, y: self.controller.view.frame.height - 88, width: 124, height: 40)
      let rightButton: Button = Button(frame: rightButtonFrame, type: .Raised)
      rightButton.action = { self.controller.setDone() }
      rightButton.backgroundColor = Color().blue
      rightButton.add(title: "DONE", color: Color().white)
      buttons += [rightButton]
      return buttons
      
   }
   
   private mutating func createLabels() -> [UILabel] {
      
      let homeHint: HomeHint = HomeHint()
      let homeContent: HomeContentLabel = HomeContentLabel()
      let homeAccent: HomeAccent = HomeAccent()
      
      let exercise: [UILabel] = self.createExerciseLabels(homeHint, homeContent: homeContent)
      
      let reps: [UILabel] = self.createRepsLabels(homeHint, homeContent: homeContent)
      
      let weight: [UILabel] = self.createWeightLabels(homeHint, homeContent: homeContent)
      
      let rest: [UILabel] = self.createRestLabels(homeHint, homeAccent: homeAccent)
      
      return exercise + reps + weight + rest
      
   }
   
   private mutating func createExerciseLabels(homeHint: HomeHint, homeContent: HomeContentLabel) -> [UILabel] {
      
      let exerciseHintFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 80, y: self.controller.view.frame.height / 2 - 134, width: 160, height: 19)
      let exerciseHintLabel: UILabel = UILabel(frame: exerciseHintFrame, properties: homeHint)
      exerciseHintLabel.text = "Exercise Name"
      self.views[exerciseHintLabel] = (delay: 0.025, alpha: homeHint.alpha)
      
      let exerciseFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 80, y: self.controller.view.frame.height / 2 - 107, width: 160, height: 48)
      let exerciseLabel: UILabel = UILabel(frame: exerciseFrame, properties: homeContent)
      exerciseLabel.text = "\(controller.workout!.sets[0].name)"
      self.views[exerciseLabel] = (delay: 0.025, alpha: exerciseLabel.alpha)
      
      return [exerciseHintLabel, exerciseLabel]
   }
   
   private mutating func createRepsLabels(homeHint: HomeHint, homeContent: HomeContentLabel) -> [UILabel] {
      
      let repsX: CGFloat = self.controller.view.frame.width.halfCentered(side: .Left, size: 136)
      let repsHintFrame: CGRect = CGRect(x: repsX, y: self.controller.view.frame.height / 2 - 51, width: 136, height: 19)
      let repsHint: UILabel = UILabel(frame: repsHintFrame, properties: homeHint)
      repsHint.text = "Reps"
      self.views[repsHint] = (delay: 0.05, alpha: homeHint.alpha)
      
      let repsFrame: CGRect = CGRect(x: repsX, y: self.controller.view.frame.height / 2 - 24, width: 136, height: 48)
      let repsLabel: UILabel = UILabel(frame: repsFrame, properties: homeContent)
      repsLabel.text = "\(controller.workout!.sets[0].reps!)"
      self.views[repsLabel] = (delay: 0.05, alpha: homeContent.alpha)
      
      return [repsHint, repsLabel]
      
   }
   
   private mutating func createWeightLabels(homeHint: HomeHint, homeContent: HomeContentLabel) -> [UILabel] {
      
      let weightX: CGFloat = self.controller.view.frame.width.halfCentered(side: .Right, size: 136)
      let weightHintFrame: CGRect = CGRect(x: weightX, y: self.controller.view.frame.height / 2 - 51, width: 136, height: 19)
      let weightHint: UILabel = UILabel(frame: weightHintFrame, properties: homeHint)
      weightHint.text = "Weight"
      self.views[weightHint] = (delay: 0.05, alpha: homeHint.alpha)
      
      let weightFrame: CGRect = CGRect(x: weightX, y: self.controller.view.frame.height / 2 - 24, width: 136, height: 48)
      let weightLabel: UILabel = UILabel(frame: weightFrame, properties: homeContent)
      weightLabel.text = "\(Int(controller.workout!.sets[0].weight!))"
      self.views[weightLabel] = (delay: 0.05, alpha: homeContent.alpha)
      
      return [weightHint, weightLabel]
      
   }
   
   private mutating func createRestLabels(homeHint: HomeHint, homeAccent: HomeAccent) -> [UILabel] {
      
      let restHintFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 68, y: self.controller.view.frame.height / 3 * 2 , width: 136, height: 16)
      let restHint: UILabel = UILabel(frame: restHintFrame, properties: homeHint)
      restHint.text = "Rest"
      self.views[restHint] = (delay: 0.075, alpha: homeHint.alpha)
      
      let restFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 68, y: self.controller.view.frame.height / 3 * 2 + 20, width: 136, height: 32)
      let restLabel: UILabel = UILabel(frame: restFrame, properties: homeAccent)
      restLabel.text = "\(controller.workout!.sets[0].restTime!.toString())"
      self.views[restLabel] = (delay: 0.075, alpha: homeAccent.alpha)
      
      return [restHint, restLabel]
      
   }
   
}







