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
      return WorkoutSets().getWorkout(date: "160803")
   }
   // This property holds all the views that the content will contain
   var contentViews: [UIView] = []
   // Property for the header
   private var header: BoldHeader?
   // Property for the menu
   private lazy var menu: Menu = self.createMenu()
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func showMore() {
      
      print("Hello World!")
      
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
      
      for iteration in 0..<contentViews.count {
         
         let last: Int = contentViews.count - 1
         if iteration == last {
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { self.contentViews[iteration].alpha = 0.0 }, completion: { Bool in
               // Get all the views for the rest content
               let views = self.addRestContent()
               // Set all the views alpha
               
               // Add all the views for the rest content
               for a in views {
                  a.alpha = 0.0
                  self.view.addSubview(a)
                  UIView.animateWithDuration(0.3, delay: 0.3, options: .CurveEaseInOut, animations: { a.alpha = 1.0 }, completion: nil)
               }
            })
         } else {
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { self.contentViews[iteration].alpha = 0.0 }, completion: nil)
         }
         
      }
      
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
      self.addHeader()
      // Get the state of the data
      let data: HomeData = HomeData()
      // Create the views and place them in an array
      let views = data.addViews(self.workout, controller: self)
      // Iterate over all the views in the array and add them to the VC
      for view in views {
         self.view.addSubview(view)
         contentViews += [view]
      }
      // Add the menu bar
      print("Fix adding menu bar in the setup views")
      
   }
   
   /**
      Function to add the header
   */
   private func addHeader() {
      // The headers frame
      let headerFrame: CGRect = CGRect(x: 0, y: 0, width: self.width, height: 80)
      // All the actions for the header buttons and the default settings for a home header
      let homeHeader: HomeHeader = HomeHeader(left: {self.showMenu()}, right: {self.showMore()})
      // Create the header type and set its default value
      let headerOptions: HeaderType = HeaderType.Home(homeHeader)
      // Create the header
      self.header = BoldHeader(frame: headerFrame, options: headerOptions)
      // Add the header to the VC
      self.view.addSubview(self.header!)
      
   }
   
   
}

// MARK: Add the views based on state
extension Home {
   
   // This function creates and returns all the views for the new user state
   func addNewContent() -> [UIView] {
     
      // Create the views array
      var views: [UIView] = []
      let welcomeViews: HomeWelcomeViews = HomeWelcomeViews()
      views += welcomeViews.createMessages(controllerView: self.view)
      views += welcomeViews.createButtons(controllerView: self.view, controller: self)
      // Return the views
      return views
   }
   
   // This function creates and returns all the views for the rest state
   func addRestContent() -> [UIView] {
      
      let restViews: HomeRestViews = HomeRestViews()
      var views: [UIView] = []
      let bigLabel = restViews.createBigLabel(controllerView: self.view)
      views += [bigLabel]
      let message = restViews.createMessage(controllerView: self.view)
      views += [message]
      let buttons = restViews.createButtons(controllerView: self.view, controller: self)
      views += buttons
      return views
      
   }
   
   // This function creates and returns all the views for the standard content
   func addStandardContent() -> [UIView] {
      
      // Create the views array that will be returned
      var views: [UIView] = []
      // Create the standard view struct
      let standardViews: HomeStandardViews = HomeStandardViews()
      // Create all the labels
      let labels: [UIView] = standardViews.addLabels(controllerView: self.view, controller: self)
      // Add the labels to the view array
      views += labels
      // Create all the buttons
      let buttons: [UIView] = standardViews.addBottomButtons(controllerView: self.view, controller: self)
      // Add the buttons to the view array
      views += buttons
      return views
      
   }
   
}

// MARK: Navigation Stuff
extension Home {
   
   private func createMenu() -> Menu {
      
      let width: CGFloat = self.width + 240
      let frame: CGRect = CGRect(x: -240, y: 0, width: width, height: self.height)
      let icons: [UIImage] = [Images.Action().home, Images.Content().add, Images.Action().reorder]
      let labels: [String] = ["Home", "New Workout", "All Workouts"]
      let menu: Menu = Menu(frame: frame, icons: icons, labels: labels, actions: [])
      return menu
      
   }
   
   private func showMenu() {
      
      self.view.addSubview(menu)
      self.menu.showView()
      
   }
   
   private func hideMenu() {
      
      self.menu.hideView()
      self.menu.removeFromSuperview()
      
   }
   
}






