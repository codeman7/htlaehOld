//
//  NewWorkout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
    This class is used for the new workout view controller
 */
class NewWorkout: Controller {
   /// Holds the workout so far
   /// Holds the date for the workout
   override func viewDidLoad() {
      // Call the supers method
      super.viewDidLoad()
      // Set up all the views
      self.setupViews()
   }
   
   
   /**
      This function adds the current set to the workout
   */
   func addSet() {
      
      
      
   }
   
   /**
      This function adds the current workout to the DB Cloud and on Device
   */
   func addWorkout() {
      
   }
   
   /**
      This method segues to preview the workout
   */
   func showPreview() {
      
   }
   
   /**
      This function controls segues to other ViewControllers
   */
   override func segue(destination: NavigationDestinations) {
      
      print("Fix this so we can segue")
      
   }
}

extension NewWorkout : ViewSetup {
   /**
      This function adds all the views to the VC
   */
   func setupViews() {
      
      let bigButton: Button = self.bigButton()
      self.view.addSubview(bigButton)
      // Set the background color for the view
      self.view.backgroundColor = Color().white
      // Add the header
      self.addHeader()
      // Create the new workout views struct
      let newWorkoutViews: NewWorkoutStandardViews = NewWorkoutStandardViews(controller: self)
      // Get all the views to add
      let views: [UIView] = newWorkoutViews.createViews()
      // Iterate over the views and add them to the VC
      for view in views {
         self.view.addSubview(view)
      }
      
      
   }
   
   func bigButton() -> Button {
      let buttonFrame: Rect = Rect(x: 0, y: 68, w: self.width, h: self.height - 68)
      let button: Button = Button(frame: buttonFrame, type: .Flat)
      button.action = { self.hideKeyboard() }
      button.backgroundColor = .clearColor()
      return button
   }
   
   func hideKeyboard() {
      print("Button being touched")
      self.resignFirstResponder()
      self.view.endEditing(true)
   }
   
   /**
     This function adds the header to the view
   */
   private func addHeader() {
      // Set the headers frame
      let headerFrame: CGRect = CGRect(x: 0, y: 0, width: self.width, height: 70)
      // Initiate some styles for the header
      let newWorkoutHeader: NewWorkoutHeader = NewWorkoutHeader(controller: self)
      // Create the header type and set its default values
      let headerOptions: HeaderType = HeaderType.NewWorkout(newWorkoutHeader)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: headerFrame, options: headerOptions)
      // Add the header to the VC
      self.view.addSubview(header)
      
   }
   
}

// MARK: This extension is for all menu related items
extension NewWorkout {
   
   /// This method shows the menu and adds it to the vc
   func showMenu() {
      
   }
   
   /// This method hides the menu
   func hideMenu() {
      
   }
   
}







