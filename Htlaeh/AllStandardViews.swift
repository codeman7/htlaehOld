//
//  AllStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
  This struct is for creating and returning all the views for the all workout VC
*/
struct AllStandardViews : ViewsStruct {
   // MARK: Properties
   /// Property for the controller that will hold all the views
   let controller: All
   
   /// Property for the views and their delay and alpha
   var views: [UIView : (delay: Double, alpha: CGFloat)] = [:]
   
   // MARK: Initializer
   init(controller: All) {
      self.controller = controller
   }
   
   init<T : Controller>(controller: T) {
      self.controller = controller as! All
   }
   
   mutating func layoutViews() {
      
      
      guard self.controller.workouts.isEmpty == false else {
         // Layout the views for empty database
         self.emptyLayout()
         return
      }
      // Get the header, add it to the view and set its alpha
      let header: BoldHeader = self.createHeader()
      // Add the scroller
      self.createAndAddScroller(header)
      
      // Add the header as a subview
      self.controller.view.addSubview(header)
      // Add the header to the views dict
      self.views[header] = (delay: 0.0, alpha: 1.0)
      header.elevate(0.0)
      // Get the fab, add it to the view, and set its alpha
      let fab: Button = self.createFAB()
      // Add the fab to the views dict
      self.views[fab] = (delay: 0.25, alpha: 1.0)
      
   }
   
   // MARK: Functions
   /// This function returns the header
   fileprivate func createHeader() -> BoldHeader {
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Create styles for the header
      let workoutHeader: HeaderType = HeaderType.all(controller: self.controller)
      
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: workoutHeader)
      
      // Set the headers alpha to 0
      header.alpha = 0.0
      // Return the header
      return header
      
   }
   
   /// This function returns the the FAB
   fileprivate func createFAB() -> Button {
      // Create the frame for the FAB
      let frame: CGRect = CGRect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .fab)
      // Set the buttons background color
      fab.backgroundColor = .blue
      // Add the icon to the button
      fab.add(image: Images.Action().search, color: .white)
      // Set the action for the button
      fab.action = { self.controller.fabTouch() }
      // Set the fab to be the controllers fab variable
      controller.FAB = fab
      // Add the fab to the view
      self.controller.view.addSubview(fab)
      // Set the fab's alpha to 0
      fab.alpha = 0.0
      // Return the fab
      return fab
      
      
   }
   
   /// This function returns the scroller
   fileprivate func createAndAddScroller(_ header: BoldHeader) {
      // Create the frame for the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      // Create the scroller
      // Make sure there are workouts in the database
      guard self.controller.workouts.isEmpty == false else { return }
      // Create the scroller
      let scroller: Scroller = Scroller(frame: frame, exercise: nil, header: header)
      // Add the scroller to the view
      self.controller.view.addSubview(scroller)
      
   }
   
   mutating func emptyLayout() {
      // Get the header, add it to the view and set its alpha
      let header: BoldHeader = self.createHeader()
      // Add the header as a subview
      self.controller.view.addSubview(header)
      // Hide the header's right icon
      header.removeRightIcon()
      // Add the header to the views dict
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      let bigLabel = self.createBigLabel()
      self.views[bigLabel] = (delay: 0.025, alpha: HomeLabel.bigLabel.alpha)
      
      let message = self.createMessageLabel()
      self.views[message] = (delay: 0.05, alpha: HomeLabel.message.alpha)
      
      let addButton = self.createAddButton()
      self.views[addButton] = (delay: 0.1, alpha: 1.0)
      
   }
   
   fileprivate func createBigLabel() -> UILabel {
      // Create the frame for the label and it's properties
      let frame: CGRect = CGRect(x: 16, y: self.controller.view.frame.height / 2 - 104, width: self.controller.width - 32, height: 48)
      
      // Create the big label and set its text
      let restLabel: UILabel = UILabel(frame: frame, properties: HomeLabel.bigLabel)
      restLabel.text = "No Workouts"
      
      // Add the label as a subview and return it
      self.controller.view.addSubview(restLabel)
      return restLabel
      
   }
   
   fileprivate func createMessageLabel() -> UILabel {
      // Create the message's label and height
      let text: String = "You have not added any workouts yet, its ok. Let's get started by adding one now."
      let height = text.heightWithConstrainedWidth(240, font: Fonts.Regular.sixteen)
      
      // Create the messages frame and properties
      let messageFrame: CGRect = CGRect(x: self.controller.view.frame.width / 2 - 120, y: self.controller.view.frame.height / 2 - 40, width: 240, height: height)
     
      // Create the message and set it's text
      let message: UILabel = UILabel(frame: messageFrame, properties: HomeLabel.message)
      message.text = text
      
      // Set the label to have multiple lines
      message.multipleLines()
      
      // Add the label as a subview and return it
      self.controller.view.addSubview(message)
      return message
   }
   
   fileprivate func createAddButton() -> Button {
      // Create the button's frame and the button
      let buttonFrame: Rect = Rect(x: (self.controller.width - 124) / 2, y: self.controller.height - 160, w: 124, h: 40)
      let button: Button = Button(frame: buttonFrame, type: .raised)
      
      // Add the title and set the buttons background color
      button.backgroundColor = .blue
      button.set(title: "ADD WORKOUT", color: .white)
      
      // Set the button's actions
      button.action = { self.controller.segueToNew() }
      
      // Add the button as s subview and return it
      self.controller.view.addSubview(button)
      return button
      
   }
   
}






