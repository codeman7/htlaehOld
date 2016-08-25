//
//  All.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit


class All : Controller {
   // MARK: Properties
   // TODO: Edit the all workout type to handle different types
   /// The workout for the VC
   let workouts: [Workout] = RealmQuery().all
   /// The variable to hold the FAB
   var FAB: Button? = nil
   
   // MARK: View did load
   override func viewDidLoad() {
      // Call the super
      super.viewDidLoad()
      // Layout views
      self.setupViews()
      
   }
   
   /**
      This function shows the calendar from a press on the cal button in the header
   */
   func showCal() {
      print("Show calendar")
   }
   
   /**
      This function handles any touches from the FAB
   */
   func fabTouch() {
      
      let search: AllToSearch = AllToSearch(all: self)
      search.segue()
      
   }
   
   /**
      This function segues to new workout if the database is empty
   */
   func segueToNew() {
      
      let new: AllToNew = AllToNew(new: NewWorkout(), all: self)
      new.segue()

   }
   
}

// MARK: Conformance to View Setup protocol
extension All : ViewSetup {
   /// This function lays out all the views
   func setupViews() {
      // Set the background color
      self.view.backgroundColor = .white
      // Create the views struct
      var views: ViewsStruct = AllStandardViews(controller: self)
      // Add all the views to the controller
      views.layoutViews()
      views.show()
      
   }
   
}








