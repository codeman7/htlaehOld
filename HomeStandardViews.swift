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
      
      
      let titles: [Location: (hint: SetVariable, label: String)] = [.top : (hint: SetVariable.Exercise, label: self.controller.workout![0].name), .left : (hint: SetVariable.Reps, label: "\(self.controller.workout![0].reps!)"), .right : (hint: SetVariable.Weight, label: "\(Int(self.controller.workout![0].weight!))")]
      let setview: ActiveSetView = ActiveSetView(view: self.controller.view, titles: titles)
      self.controller.view.addSubview(setview)
      self.controller.activeViews = setview
      /*// Get the exercise labels
      let labels: [UILabel] = self.createLabels()
      // Iterate over the exercise labels and add them to the view, set their alpha and add them to the view property
      for label in labels {
         label.alpha = 0.0
         self.controller.view.addSubview(label)
      }
      */
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
      leftButton.backgroundColor = .red
      leftButton.set(title: "SKIP", color: .white)
      buttons += [leftButton]
      
      let xRight: CGFloat = self.controller.view.frame.width.halfCentered(side: .Right, size: 124)
      let rightButtonFrame: CGRect = CGRect(x: xRight, y: self.controller.view.frame.height - 88, width: 124, height: 40)
      let rightButton: Button = Button(frame: rightButtonFrame, type: .Raised)
      rightButton.action = { self.controller.setDone() }
      rightButton.backgroundColor = .blue
      rightButton.set(title: "DONE", color: .white)
      buttons += [rightButton]
      return buttons
      
   }
   
}







