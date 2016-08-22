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
      // Get the header, add it to the view and set its alpha
      let header: BoldHeader = self.createHeader()
      // Add the header to the views dict
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      self.createAndAddScroller()
      
      
      // Get the fab, add it to the view, and set its alpha
      let fab: Button = self.createFAB()
      // Add the fab to the views dict
      self.views[fab] = (delay: 0.25, alpha: 1.0)
      
   }
   
   // MARK: Functions
   /// This function returns the header
   private func createHeader() -> BoldHeader {
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Create styles for the header
      let workoutHeader: HeaderType = HeaderType.all(controller: self.controller)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: workoutHeader)
      // Add the header to the view
      self.controller.view.addSubview(header)
      // Set the headers alpha to 0
      header.alpha = 0.0
      // Return the header
      return header
      
   }
   
   /// This function returns the the FAB
   private func createFAB() -> Button {
      // Create the frame for the FAB
      let frame: CGRect = CGRect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .FAB)
      // Set the buttons background color
      fab.backgroundColor = Color().blue
      // Add the icon to the button
      fab.add(image: Images.Action().search, color: Color().white)
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
   func createAndAddScroller() {
      // Create the frame for the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      // Create the scroller
      // Make sure there are workouts in the database
      guard self.controller.workouts.isEmpty == false else { return }
      // Create the scroller
      let scroller: AllScroller = AllScroller(frame: frame, workouts: self.controller.workouts)
      // Add the scroller to the view
      self.controller.view.addSubview(scroller)
      
   }
   
}