//
//  Preview.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This view controller is for when a User wants to preview a workout while creating it
 */
class PreviewWorkout : Controller {
   // MARK: Preview
   // Variable for the FAB
   lazy var FAB: Button = {
      let fab = PreviewWorkoutViews(controller: self).createFAB()
      return fab
   }()
   // Variables for the mini FAB's
   private lazy var addFAB: Button = {
      return PreviewWorkoutViews(controller: self).createMiniAddFAB()
   }()
   
   private lazy var editFAB: Button = {
      return PreviewWorkoutViews(controller: self).createMiniEditFAB()
   }()
   // Variable for the workout that the VC will show
   lazy var workout: Workout = self.getWorkout()
   
   // MARK: View did load
   override func viewDidLoad() {
      // Call the super initializer
      super.viewDidLoad()
      // Layout views
      self.setupViews()
   }
   
   // MARK: Functions
   func getWorkout() -> Workout {
      
      var workout: Workout = Workout()
      let set: WeightSet = WeightSet(name: "Squat", setCount: 0, reps: 12, restTime: 75, weight: 225, time: nil, date: "160812", complete: false, synced: false)
      let set1: WeightSet = WeightSet(name: "Deadlift", setCount: 1, reps: 8, restTime: 120, weight: 185, time: nil, date: "160812", complete: false, synced: false)
      workout = workout.add(set)
      workout = workout.add(set1)
      return workout
      
   }
   
   func FABAction() {
      
      if self.FAB.backgroundColor! == UIColor.red {
         self.FAB.updateFAB(.blue, image: Images.Content().add)
         self.hideMiniFABs()
      } else {
         self.FAB.updateFAB(.red, image: Images.Navigation().close)
         self.showMiniFABs()
      }
      
   }
   
   func showMiniFABs() {
      
      // Update the mini fab's alpha
      self.addFAB.alpha = 1.0
      self.editFAB.alpha = 1.0
      UIView.animateWithDuration(0.3, animations: {
         self.addFAB.frame.origin.x = self.width - 128
         self.editFAB.frame.origin.y = self.height - 128
      })
      
   }
   
   func hideMiniFABs() {
      
      // Animate the FAB's behind the big FAB
      UIView.animateWithDuration( 0.3, animations: {
         self.addFAB.frame.origin.x = self.width - 64
         self.editFAB.frame.origin.y = self.height - 64
         }, completion: { Bool in
            // Update the mini fab's alpha
            self.addFAB .alpha = 0.0
            self.editFAB.alpha = 0.0
      })
   }
   
   func addMoreToWorkout() {
      
      let splashView: CircularView = CircularView(point: CGPoint(x: self.width - 108, y: self.height - 44), color: .yellow)
      self.view.addSubview(splashView)
      splashView.grow()
      UIView.animateWithDuration( 0.3, delay: 0.3, options: UIViewAnimationOptions(), animations: { splashView.alpha = 0.0 }, completion: nil)
   }
   
   func editSets() {
      
      print("Edit set")
      
   }
   
   func backToNewWorkout() {
      // Create the new workout controller
      let new: NewWorkout = NewWorkout()
      // Set the new workout controller's workout value
      new.workout = self.workout
      // Create the circular view
      let splashView: CircularView = CircularView(point: CGPoint(x: 43, y: 46), color: .white)
      // Add the view to the controller
      self.view.addSubview(splashView)
      // Animate the view
      splashView.grow()
      // Add all the subview for new workout and segue back
      var newWorkoutViews: NewWorkoutStandardViews = NewWorkoutStandardViews(controller: new)
      newWorkoutViews.layoutViewsWithAlpha(self)
   }
   
}

// MARK: Make sure it conforms to view setup protocol
extension PreviewWorkout : ViewSetup {
   // This function lays out all the views
   func setupViews() {
      // Set the background color for the view
      self.view.backgroundColor = .white
      // Create the struct that will create all the views
      let views: PreviewWorkoutViews = PreviewWorkoutViews(controller: self)
      // Add all the views
      views.layoutViews()
      // Add mini FABs to the view
      self.view.insertSubview(self.editFAB, belowSubview: self.FAB)
      self.addFAB.icon?.alpha = 0.54
      self.view.insertSubview(self.addFAB, belowSubview: self.FAB)
      
   }
   
}






