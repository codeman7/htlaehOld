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
struct AllStandardViews : AllViews {
   // MARK: Properties
   let controller: All
   
   // MARK: Initializer
   init(controller: All) {
      self.controller = controller
   }
   // MARK: Functions
   /// This function returns the header
   func createAndAddHeader() {
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Create styles for the header
      let workoutHeader: HeaderType = HeaderType.all(controller: self.controller)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: workoutHeader)
      // Add the header to the view
      self.controller.view.addSubview(header)
      
   }
   
   /// This function returns the the FAB
   func createAndAddFAB() {
      // Create the frame for the FAB
      let frame: CGRect = CGRect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .FAB)
      // Set the buttons background color
      fab.backgroundColor = Color().blue
      // Add the icon to the button
      fab.addIcon(Images.Action().search, color: Color().white)
      // Set the action for the button
      fab.action = { self.controller.fabTouch() }
      // Set the fab to be the controllers fab variable
      controller.FAB = fab
      // Add the fab to the view
      self.controller.view.addSubview(fab)
      
      
   }
   
   /// This function returns the scroller
   func createAndAddScroller() {
      // Create the frame for the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      // Create the scroller
      // TODO: Fix the variable for workouts
      let scroller: AllScroller = AllScroller(frame: frame, workouts: [])
      // Add the scroller to the view
      self.controller.view.addSubview(scroller)
      
   }
   
}