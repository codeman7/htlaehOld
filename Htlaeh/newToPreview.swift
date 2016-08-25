//
//  newToPreview.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/25/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct NewToPreview {
   let new: NewWorkout
   let preview: PreviewWorkout
   
   init(new: NewWorkout, preview: PreviewWorkout) {
      self.new = new
      self.preview = preview
   }
   
   func segue() {
      
      // Hide the keyboard
      self.new.view.endEditing(true)
      self.new.resignFirstResponder()
      // Make sure workout isn't empty
      guard self.new.workout.count != 0 else {
         self.new.addSetToast()
         // Exit the function
         return
      }
      // Create the circular view
      let splashView: CircularView = CircularView(point: CGPoint(x: new.width - 29, y: 46), color: .white)
      // Add the circular view to the controller
      self.new.view.addSubview(splashView)
      // Animate the view to take up the whole screen
      splashView.grow()
      // Add all the subviews to the view and segue to preview
      let previewViews: PreviewWorkoutViews = PreviewWorkoutViews(controller: self.preview)
      previewViews.layoutViewsWithAnimatedAlpha(self.new)
      
      
   }
   
   
}