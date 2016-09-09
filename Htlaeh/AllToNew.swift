//
//  AllToNew.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/25/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct AllToNew {
   let new: NewWorkout
   let all: All
   
   init(new: NewWorkout, all: All) {
      self.new = new
      self.all = all
   }
   
   func segue() {
      
      // Get all the views
      let views: [UIView] = self.all.view.subviews
      
      // Create the splash view that will cover up the page and add it as a subview
      let splashView: CircularView = CircularView(point: CGPoint(x: self.all.width / 2, y: self.all.height - 180), color: .blue)
      self.all.view.addSubview(splashView)
      
      // Animate the splash view and remove all the views from all
      let completion: () -> () = {
         // Remove all views except splash view and fade the splash view
         for view in views { view.removeFromSuperview() }
         UIView.animateWithDuration(0.25, animations: {
            splashView.alpha = 0.0
            }, completion: { Bool in
               self.all.presentViewController(self.new, animated: false, completion: nil)
               
         })
      }
      
      splashView.grow(completion)
      
      
      
      
      
   }
   
   
}
