//
//  SearchFilter.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
 Use this struct when I want to show the a filter for search
*/
struct SearchFilter {
   
   // MARK: Properties
   // The controller that will hold all the views
   let controller: Search
   
   lazy var sheet: FilterSheet = self.createBottomSheet()
   private lazy var close: Button = self.createCloseFAB()
   
   // MARK: Initializers
   init(_ controller: Search) {
      // Set the controller property
      self.controller = controller
      
   }
   
   // MARK: Functions
   
   /// Function to show the filter
   mutating func showFilter() {
      
      // Show the bottom sheet, animate the fab's location, and show the close fab
      self.showBottomSheet()
      self.animateFAB()
      self.showCloseFAB()
      
   }
   
   /// Function to animate the FAB
   private func animateFAB() {
   
      // Animate the FAB
      self.controller.FAB.moveUpLeftTo(endPoint: CGPoint(x: 44, y: self.controller.height - 284))

      // Update the FAB's icon
      self.controller.FAB.icon?.image = Images.Action().date
      self.controller.FAB.icon?.colorImage(.white)
      
   }
   
   private func createBottomSheet() -> FilterSheet {
      
      // Get the values for the sheet
      let values: (rMin: Int, rMax: Int, wMin: Int, wMax: Int) = RealmQuery().getRangesFor(self.controller.exercise)
      // Create the sheet and add the content
      let sheet: FilterSheet = FilterSheet(viewableFrame: self.controller.view.frame, height: 284)
      sheet.initialValues = values
      sheet.action = { self.controller.refine() }
      sheet.addContent()
      
      // Return the sheet
      return sheet
      
   }
   
   /// Function to animate the bottom sheet
   private mutating func showBottomSheet() {
   
      // Add the sheet below the fab and show the sheet
      self.controller.view.insertSubview(self.sheet, belowSubview: self.controller.FAB)
      self.sheet.show()
      
      // Set the sheet's delay
      self.sheet.backgroundGray.action = { self.hideFilter() }
      
      // Delay the animation but add the subviews to the sheet
      Delay().delay(0.05, closure: {
         self.sheet.showViews()
      })
      
   }
   
   private func createCloseFAB() -> Button {
      
      // Get the frame for the FAB and create the FAB
      let frame: Rect = Rect(x: self.controller.width - 72, y: self.controller.height - 312, w: 56, h: 56)
      let close: Button = Button(frame: frame, type: .fab)
      
      // Set the background color and add the icon
      close.backgroundColor = .red
      close.add(Images.Navigation().close, color: .white)
      
      // Return the fab
      return close
      
   }
   
   /// Function to add the new FAB
   private mutating func showCloseFAB() {
      
      self.close.action = { self.hideFilter() }
      self.controller.view.addSubview(self.close)
      self.close.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01)
      let delay: Delay = Delay()
      delay.delay(0.195, closure: {
         UIView.animateWithDuration(0.055, animations: {
            self.close.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
            }, completion: nil)
      })
      
   }
   
   mutating func hideFilter() {
      
      // Hide the close fab
      UIView.animateWithDuration(0.175, delay: 0.0, options: .CurveEaseInOut, animations: {
         
         // Hide the close button
         self.close.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05)

         }, completion: { Bool in self.close.removeFromSuperview() })

      // Hide the sheet
      self.sheet.hide()
      
      // Animate the FAB
      self.controller.FAB.icon?.image = Images.Content().filter
      self.controller.FAB.icon?.colorImage(.white)
      self.controller.FAB.moveDownRightTo(endPoint: CGPoint(x: self.controller.width - 44, y: self.controller.height - 44))
      
      
   }
   
}






