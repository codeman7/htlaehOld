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
      
      // Get the scroller
      let scroller = self.createScroller()
      // Add the scroller to the view
      self.controller.view.addSubview(scroller)
      // Get the header
      let header: BoldHeader = self.createHeader()
      // Add the header to the view
      self.controller.view.addSubview(header)
      // Add the fab to the controller
      self.controller.view.addSubview(self.controller.FAB)

      
   }
   
   /// When you want to add the views with the alpha property animating them into view
   func layoutViewsWithAnimatedAlpha(oldController: NewWorkout) {
      
      // Get the scroller
      let scroller = self.createScroller()
      // Set the scrollers alpha
      scroller.alpha = 0.0
      // Add the scroller to the view
      oldController.view.addSubview(scroller)
      // Get the header
      let header = self.createHeader()
      // Set the headers alpha
      header.alpha = 0.0
      // Add the header to the view
      oldController.view.addSubview(header)
      // Get the fab
      let fab = self.createFAB()
      // Set the fab's alpha
      fab.alpha = 0.0
      // Add the fab to the view
      oldController.view.addSubview(fab)
      // Animate the views alpha
      UIView.animateWithDuration( 0.3, delay: 0.25, options: UIViewAnimationOptions(), animations: {
         scroller.alpha = 1.0
         header.alpha = 1.0
         fab.alpha = 1.0
         }, completion: { Bool in
            oldController.presentViewController(self.controller, animated: false, completion: nil)
      })
      
      
   }
   
   // MARK: Functions
   /// Creates the header
   private func createHeader() -> BoldHeader {
      
      // Set the frame for the header
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Set the styles for the header
      let workoutHeader: HeaderType = HeaderType.preview(self.controller)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: workoutHeader)
      // Return the header
      return header
      
   }
   
   /// Creates the FAB
   func createFAB() -> Button {
      // Create the frame for the FAB
      let frame: Rect = Rect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .fab)
      // Set the background color
      fab.backgroundColor = .blue
      // Add the icon to the button
      fab.add(Images.Content().add, color: .white)
      // Set the action for the button
      fab.action = { self.controller.FABAction() }
      // Set the fab to be the controllers fab variable
      //controller.FAB = fab
      // Return the FAB
      return fab
      
   }
   
   func createMiniEditFAB() -> Button {
      
      // Set the frame for the FAB
      let frame: Rect = Rect(x: self.controller.width - 64, y: self.controller.height - 64, w: 40, h: 40)
      // Create the fab
      let FAB: Button = Button(frame: frame, type: .fab)
      // Set the background color for the fab
      FAB.backgroundColor = .blue
      // Set icon for the FAB
      FAB.add(Images.Editor().edit, color: .white)
      // Set the action for the FAB
      FAB.action = { self.controller.editSets() }
      // Set the fab's alpha
      FAB.alpha = 0.0
      // Return the fab
      return FAB
      
   }
   
   func createMiniAddFAB() -> Button {
      
      // Set the frame for the FAB
      let frame: Rect = Rect(x: self.controller.width - 64, y: self.controller.height - 64, w: 40, h: 40)
      // Create the fab
      let FAB: Button = Button(frame: frame, type: .fab)
      // Set the background color for the fab
      FAB.backgroundColor = .yellow
      // Set icon for the FAB
      FAB.add(Images.Content().add, color: .black)
      // Set the action for the FAB
      FAB.action = { self.controller.addMoreToWorkout() }
      // Set the Fab's alpha
      FAB.alpha = 0.0
      // Return the fab
      return FAB
      
   }
   
   /// Creates the scroller
   private func createScroller() -> PreviewScroller {
      // Create the frame for the scroller
      let frame: Rect = Rect(x: 0, y: 80, w: self.controller.width, h: self.controller.height - 80)
      // Create the scroller
      let scroller: PreviewScroller = PreviewScroller(frame: frame, workout: self.controller.workout)
      // Return the scroller to the view
      return scroller
      
   }
   
   /// Creates the mini FABs
   func createMiniFAB(color: UIColor, iconColor: UIColor, icon: UIImage, action: ()->()) -> Button {
      // Set the frame for the fab
      let frame: Rect = Rect(x: self.controller.width - 64, y: self.controller.height - 64, w: 40, h: 40)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .fab)
      // Set the background color for the fab
      fab.backgroundColor = color
      // Add the icon to the fab
      fab.add(icon, color: iconColor)
      // Set the action for the fab
      fab.action = action
      // Return the fab
      return fab
      
   }
}






