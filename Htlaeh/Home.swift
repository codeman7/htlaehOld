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
      
      print("This set is done")
      
   }
   
   func showTutorial() {
      
      print("Show tutorial")
      let tutorial: HomeTutorial = HomeTutorial()
      let views: [ViewRepresentable] = tutorial.firstStep(controllerView: self.view)
      self.view.layer.addSublayer(views[0] as! CAShapeLayer)
      self.view.addSubview(views[1] as! UIView)
      self.view.addSubview(views[2] as! UIView)
      
      
   }
   
   func skipTutorial() {
      
      print("Fix a tutorial skip")
      /*
      for iteration in 0..<contentViews.count {
         
         let last: Int = contentViews.count - 1
         if iteration == last {
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { self.contentViews[iteration].alpha = 0.0 }, completion: { Bool in
               // Get all the views for the rest content
               let restViews: HomeRestViews = HomeRestViews()
               // Add all the views for the rest content
               restViews.addRestViewsToView(self.view, controller: self) })
         } else {
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { self.contentViews[iteration].alpha = 0.0 }, completion: nil)
         }
         
      }*/
      
   }
   
   func showCal() {
      
      print("Segue from rest to cal")
      
   }
   
   func restToNewWorkout() {
      
      print("Segue to new workout")
      
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
      
      self.view.backgroundColor = Color().white
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








