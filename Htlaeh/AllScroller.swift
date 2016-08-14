//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/14/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Scroller is used to hold cards
*/
class AllScroller: UIScrollView {
   
   // MARK: Properties
   let workouts: [Workout]
   
   // MARK: Initializers
   init(frame: CGRect, workouts: [Workout]) {
      
      self.workouts = workouts
      super.init(frame: frame)
      self.defaultSettings()
      self.add()
      
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function sets all the default settins for the scroller
    */
   func defaultSettings() {
      // Set the background color for the scroller
      self.backgroundColor = Color().white
      // Set the delegate for the scroller
      self.delegate = self
      // Get the height for the scroller
      var height: CGFloat = 0
      
      for _ in 0..<self.workouts.count {
         height += 25
      }
      // Set the content height for the scroller
      self.contentSize = CGSize(width: self.frame.width, height: height)
      
   }
   
   func add() {
      
      //let tableFrame: CGRect = CGRect(x: 0, y: 0, w: self.frame.w, h: self.frame.h)
      //let table:
      
   }
   
   
}

// MARK: Delegate methods
extension AllScroller : UIScrollViewDelegate {
   
   // TODO: Add scroll
   
}






