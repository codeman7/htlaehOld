//
//  Home.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit


class Home: Controller {
   // MARK: Properties
   // This holds the workout for the VC
   var workout: Workout? {
      return RealmQuery().getWorkoutFor(date: Date().today())
   }
   /// Property for the header of the controller
   lazy var header: BoldHeader = {
      return self.createHeader()
   }()
   
   /// The variable for the current set that the User is on in the workout
   var setCount: Int = 0
   
   /// The property for the active views that are the main content
   var activeViews: ActiveSetView? = nil
   
   /// The property for the help views that are next to be main content
   var helperViews: [UIView] = []
   
   
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
   
   func setDone() {
      
      let set = RealmQuery().setFor(setCount, date: Date().today())
      print(set)
      
      guard let s = set else {
         return
      }
      print(s)
      RealmStore().done(set: s)
      // Update the set count
      self.setCount += 1
      guard workout?.sets.count > self.setCount else {
         print("Workout done")
         return
      }
      
      guard self.activeViews != nil else {
         return
      }
      
      self.activeViews?.exit(true)
      print("Next labels will be \(workout![setCount].name), \(workout![setCount].reps), \(workout![setCount].weight)")
      
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








