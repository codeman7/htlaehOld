//
//  PreviewScroller.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit
/**
 Scroller is used to hold cards
 */
class PreviewScroller: UIScrollView {
   
   // MARK: Properties
   let workout: Workout
   
   // MARK: Initializers
   init(frame: CGRect, workout: Workout) {
      // Set the workout property
      self.workout = workout
      // Call the super initializer
      super.init(frame: frame)
      // Set the default settings
      self.defaultSettings()
      // Add the workout
      self.add(workout)
      
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
    This function sets all the default settins for the scroller
    */
   func defaultSettings() {
      // Set the background color for the scroller
      self.backgroundColor = Color().white
      // Set the delegate for the scroller
      self.delegate = self
      // Get the height for the scroller
      let height: CGFloat = CGFloat(49 + (self.workout.count * 48))
      // Set the content height for the scroller
      self.contentSize = CGSize(width: self.frame.width, height: height)
      
   }
   
   func add(workout: Workout) {
      // Set the height for the view
      let height: CGFloat = CGFloat(49 + (workout.count * 48))
      // Set the frame for the view
      let viewFrame: Rect = Rect(x: 0, y: 0, w: self.frame.w, h: height)
      // Create the view
      let workoutView: WorkoutView = WorkoutView(frame: viewFrame)
      // Add the workout to the workoutView
      workoutView.add(workout: workout)
      // Add the workout view to the view
      self.addSubview(workoutView)
      
      
   }
   
   
}

// MARK: Delegate methods
extension PreviewScroller : UIScrollViewDelegate {
   
   // TODO: Add scroll
   
}






