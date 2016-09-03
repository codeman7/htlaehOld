//
//  Home.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class Home: Controller {
   // MARK: Properties
   // This holds the workout for the VC
   var workout: Workout? = RealmQuery().getWorkoutFor(date: Date().today())
   
   /// Property for the header of the controller
   lazy var header: BoldHeader = self.createHeader()
   
   /// Property for the skip button
   lazy var skipButton: Button = HomeStandardViews(controller: self).createSkipButton()
   
   /// Property for the done button
   lazy var doneButton: Button = HomeStandardViews(controller: self).createDoneButton()
   
   /// The variable for the current set that the User is on in the workout
   var setCount: Int = 0
   
   /// The variable to decide weather the User is exercising or resting
   var active: Bool = true
   
   /// The property for the active views that are the main content
   var setView: HomeSetView? = nil
   
   /// The property for the help views that are next to be main content
   var helperViews: [UIView] = []
   
   var lastTime: NSDate = NSDate()
   var timeSinceLast: NSTimeInterval = NSDate().timeIntervalSince1970
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
      
   }
   
   func showMore() {
      
      print("Show more")
      
   }
   
   func skipSet() {
      
      print("Skip this set")
      
   }
   
   func addFifteen() {
      
      // Get the amount of rest left
      guard var amount = self.setView!.topTopContent.text!.time() else {
         return
      }
      
      // Add 15 to the amount and set it back to the top content's text
      amount += 15
      self.setView!.topTopContent.text = amount.toString()
      
   }
   
   private func markSetAsDone() {
      
      // Mark the set as done within the view controller
      let newSet: WeightSet = self.workout![setCount].setDone()
      self.workout = self.workout!.update(at: setCount, newSet: newSet)
       
      // Mark the set done in Realm
      let set = RealmQuery().setFor(setCount, date: Date().today())
      let store = RealmStore()
      if let updatedSet = set {
         store.done(set: updatedSet)
      }
      
   }
   
   func setDone() {
      
      self.timeSinceLast = self.lastTime.timeIntervalSinceDate(NSDate())
      print(abs(self.timeSinceLast))
      self.lastTime = NSDate()
      if abs(self.timeSinceLast) < 1 { print("R"); return }

      
      // Mark set as done
//      self.markSetAsDone()
      
      // Get the workout unwrapped
      if let workout = self.workout {
         // Make sure the set count isn't greater than the workout
         guard setCount < workout.count else {
               return
         }
         
         // Check to see if active or not
         if self.active == true {
            // Active
            // Update the skip button
            self.skipButton.set(title: "ADD 15", color: .white)
            self.skipButton.action = { self.addFifteen() }
            // Update active property
            self.active = false
            /* If there are more set's left in the workout
             then update set count and show next set in next
             set view
            */
            if workout.count > setCount + 1 {
               self.setCount += 1
               self.setView?.rest(set: workout[setCount])
            } else {
               // No more set's so show nothing
               self.setView?.finished()
               self.doneWithWorkout()
            }
         } else {
            // Not active
            // Update the skip button
            self.skipButton.set(title: "SKIP", color: .white)
            self.skipButton.action = { self.skipSet() }
            
            // Update active property and animate views up
            self.active = true
            /* If there are more set's left in the workout
             then update set count and show next set in next
             set view
             */
            self.setView?.next()
         }
         
      }
      
   }
   
   /// Used when the user is all done with the workout
   private func doneWithWorkout() {
      
      UIView.animateWithDuration(0.15, animations: {
            
         for button in [self.doneButton, self.skipButton] {
            button.frame.origin.y = self.height + 16
         }
            
      })
      
   }
   
   func showTutorial() {
      
      print("Show tutorial")
      
   }
   
   func skipTutorial() {
      
      print("Fix a tutorial skip")
      
   }
   
   func showCal() {
      
      print("Segue from rest to cal")
      
   }
   
   func restToNewWorkout() {
      
      print("Segue to new work")
      let circleView: CircularView = CircularView(point: CGPoint(x: self.width / 2 - 1, y: self.height - 104), color: .blue)
      self.view.addSubview(circleView)
      circleView.grow({
         self.presentViewController(NewWorkout(), animated: false, completion: nil)
      })
      
   }
   
   func restToSearch() {
      
      print("Segue to search")
      
   }
   
}


// MARK: View Setup 
extension Home: ViewSetup {
   /**
      Function to add all the views instead of using storyboards
   */
   func setupViews() {
      
      self.view.backgroundColor = .white
      // Set up the header
      self.view.addSubview(self.header)
      // Get the state of the data
      let data: HomeData = HomeData()
      // Create the views and place them in an array
      data.addViews(self.workout, controller: self)

      
   }
   
   /**
      Function to add the header
   */
   private func createHeader() -> BoldHeader {
      // The headers frame
      let headerFrame: CGRect = CGRect(x: 0, y: 0, width: self.width, height: 80)
      // All the actions for the header buttons and the default settings for a home header
      // Create the header type and set its default value
      let headerOptions: HeaderType = HeaderType.home(controller: self)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: headerFrame, options: headerOptions)
      // Return the header
      return header
      
   }
   
   
}








