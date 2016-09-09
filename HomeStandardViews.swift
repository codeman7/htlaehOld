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
      
      let frame: Rect = Rect(x: 0, y: 96, width: self.controller.width, height: self.controller.height - 168)
      let setView: HomeSetView = HomeSetView(frame: frame, set: self.controller.workout![self.controller.setCount])
      self.controller.view.addSubview(setView)
      self.controller.setView = setView
      
      // Get the buttons
      let buttons: [Button] = [self.controller.skipButton, self.controller.doneButton]
      // Iterate over the buttons and set their alpha, add them to the view, and them to the view property
      for button in buttons {
         button.alpha = 0.0
         self.controller.view.addSubview(button)
         self.views[button] = (delay: 0.1, alpha: 1.0)
      }
      
   }
   
   func createSkipButton() -> Button {
      
      let xLeft: CGFloat = self.controller.view.frame.width.halfCentered(.left, size: 124)
      let leftButtonFrame: CGRect = CGRect(x: xLeft, y: self.controller.view.frame.height - 72, width: 124, height: 40)
      let leftButton: Button = Button(frame: leftButtonFrame, type: .raised)
      leftButton.action = { self.controller.skipSet() }
      leftButton.backgroundColor = .red
      leftButton.set(title: "SKIP", color: .white)
      return leftButton
      
   }
   
   func createDoneButton() -> Button {
      
      let xRight: CGFloat = self.controller.view.frame.width.halfCentered(.right, size: 124)
      let rightButtonFrame: CGRect = CGRect(x: xRight, y: self.controller.view.frame.height - 72, width: 124, height: 40)
      let rightButton: Button = Button(frame: rightButtonFrame, type: .raised)
      rightButton.action = { self.controller.setDone() }
      rightButton.backgroundColor = .blue
      rightButton.set(title: "DONE", color: .white)
      return rightButton
      
   }
   
   func createSimpleMenu() -> SimpleDialog {
      
      let origin: CGPoint = CGPoint(x: self.controller.width - 16, y: 27)
      let buttonOne: MenuButtonInitializer = MenuButtonInitializer("Mark workout as done", action: { self.controller.markAsDone() })
      let buttonTwo: MenuButtonInitializer = MenuButtonInitializer("Change workout date", action: { print("New date") })
      let width: CGFloat = buttonOne.title.widthWithConstrainedHeight(48.0, font: .regular16) + 40
      let buttons: [MenuButtonInitializer] = [buttonOne, buttonTwo]
      let size: CGSize = CGSize(width: Int(width), height: (buttons.count * 48) + 16)
      let simple: SimpleDialog = SimpleDialog(origin: origin, expandedSize: size, buttons: [buttonOne, buttonTwo])
      return simple
      
   }
   
}







