//
//  AllViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

/**
   This protocol is for all views structs to conform to
 */
protocol AllViews {
   /// The variable for the controller that the views will be in
   var controller: All { get }
   /**
      Standard and only initializer
      - parameter controller: Should be the contoller that holds the view
   */
   init(controller: All)
   /// Lays out all the views
   func layoutViews()
   /// Creates and adds the header
   func createAndAddHeader()
   /// Creats and adds the fab
   func createAndAddFAB()
   /// Creates and adds the scroller
   func createAndAddScroller()

}

extension AllViews {
   
   func layoutViews() {
      // Add the scroller
      self.createAndAddScroller()
      // Add the header
      self.createAndAddHeader()
      // Add the FAB
      self.createAndAddFAB()
      
   }
   
}
