//
//  AllStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
  This struct is for creating and returning all the views for the all workout VC
*/
struct AllStandardViews {
   // MARK: Properties
   let controller: All
   
   // MARK: Initializer
   
   // MARK: Functions
   /// This function returns the header
   func createHeader() -> BoldHeader {
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      // Create styles for the header
      let allWorkoutHeader: AllWorkoutHeader = AllWorkoutHeader(controller: self.controller)
      // Create the header type
      let headerOptions: HeaderType = HeaderType.All(allWorkoutHeader)
      // Create the header
      let header: BoldHeader = BoldHeader(frame: frame, options: headerOptions)
      // Return the header
      return header
      
   }
   
   /// This function returns the the FAB
   func createFAB() -> Button {
      // Create the frame for the FAB
      let frame: CGRect = CGRect(x: self.controller.width - 72, y: self.controller.height - 72, w: 56, h: 56)
      // Create the FAB
      let fab: Button = Button(frame: frame, type: .FAB)
      // Set the buttons background color
      fab.backgroundColor = Color().blue
      // Add the icon to the button
      fab.addIcon(Images.Action().search, color: Color().white)
      // Set the action for the button
      fab.action = { self.controller.fabTouch() }
      // Return the button
      return fab
      
      
   }
   
   /// This function returns the scroller
   func createScroller() /*-> UIScrollView*/ {
      
   }
   
}