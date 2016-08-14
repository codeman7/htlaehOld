//
//  AllPreviewViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


struct PreviewWorkoutViews  {
   // MARK: Properties
   let controller: PreviewWorkout
   
   // MARK: Initializer
   init(controller: PreviewWorkout) {
      self.controller = controller
   }
   
   func layoutViews() {
      
      // Add the scroller
      self.createAndAddScroller()
      // Add the header
      self.createAndAddHeader()
      // Add the fab
      self.createAndAddFAB()
      
   }
   
   // MARK: Functions
   private func createAndAddHeader() {
      // Set the frame for the header
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Set the styles for the header
      let workoutHeader: HeaderType = HeaderType.preview(controller: self.controller)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: workoutHeader)
      // Add the header to the view
      self.controller.view.addSubview(header)
      
   }
   
   private func createAndAddFAB() {
      // Create the frame for the FAB
      let frame: Rect = Rect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .FAB)
      // Set the background color
      fab.backgroundColor = Color().blue
      // Add the icon to the button
      fab.addIcon(Images.Content().add, color: Color().white)
      // Set the action for the button
      fab.action = { self.controller.fabAction() }
      // Set the fab to be the controllers fab variable
      controller.FAB = fab
      // Add the fab to the view
      self.controller.view.addSubview(fab)
      
   }
   
   private func createAndAddScroller() {
      // Create the frame for the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      // Create the scroller
      let scroller: PreviewScroller = PreviewScroller(frame: frame, workout: self.controller.workout)
      // Add the scroller to the view
      self.controller.view.addSubview(scroller)
      
      
   }
   
   func createMiniFAB(color: UIColor, iconColor: UIColor, icon: UIImage, action: ()->()) -> Button {
      // Set the frame for the fab
      let frame: Rect = Rect(x: self.controller.width - 64, y: self.controller.height - 64, w: 40, h: 40)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .FAB)
      // Set the background color for the fab
      fab.backgroundColor = color
      // Add the icon to the fab
      fab.addIcon(icon, color: iconColor)
      // Set the action for the fab
      fab.action = action
      // Return the fab
      return fab
      
   }
}






