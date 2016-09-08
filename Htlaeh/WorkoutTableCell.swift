//
//  WorkoutTableCell.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used to create a standard cell in a workout view
 */
class WorkoutTableCell : UIView {
   // MARK: Properties
   
   // MARK: Initializers
   /**
      Default initializer
      - parameter frame: The y position of the view and the width
      - parameter titles: Should be an array of strings 0 being the leftmost label and 2 being the rightmost label
   */
   init(frame: (y: CGFloat, width: CGFloat), titles: [String]) {
      
      // Create the frame for the view
      let frame: Rect = Rect(x: 0, y: frame.y, w: frame.width, h: 48)
      // Call the super initializer
      super.init(frame: frame)
      // Add the labels
      self.add(labels: titles)
      // Add the bottom line
      self.addBottomLine()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function adds all the labels to the to the view
    
      - parameter labels: Should be an array of strings 0 being the leftmost label and 2 being the rightmost label
   */
   fileprivate func add(labels: [String]) {
      
      // Add the exercise
      self.add(exercise: labels[0])
      // Add the reps
      self.add(title: labels[1], padding: 208)
      // Add the weight
      self.add(title: labels[2], padding: 104)
      
   }
   
   /**
      This function adds the exercise label to the view
    
      The title should always be the first item in the array
   */
   fileprivate func add(exercise: String) {
      // Create the properties for the label
      let properties: WorkoutContentStringLabel = WorkoutContentStringLabel()
      // Set the frame for the label
      let frame: Rect = Rect(x: 16, y: 15, w: self.frame.w - 224, h: 19)
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: properties)
      // Set the text for the label
      label.text = exercise
      // Add the label to the view
      self.addSubview(label)
      
   }
   
   /**
      Adds the reps and weight labels
      - parameter title: The text property for the label
      - parameter padding: The padding from the right edge for the label
   */
   fileprivate func add(title: String, padding: CGFloat) {
      // Create the properties for the label
      let properties: WorkoutContentNumberLabel = WorkoutContentNumberLabel()
      // Set the frame for the label
      let frame: Rect = Rect(x: self.frame.w - padding, y: 15, w: 88, h: 19)
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: properties)
      // Set the text for the label
      label.text = title
      // Add the label to the view
      self.addSubview(label)
      
   }
   
   /**
      This function adds the bottom line to the view
   */
   fileprivate func addBottomLine() {
      // Create the frame for the line
      let frame: Rect = Rect(x: 0, y: self.frame.h - 1, w: self.frame.w, h: 1)
      // Create the line
      let line: Line = Line(frame: frame, alpha: 0.14)
      // Add the line to the view
      self.addSubview(line)
      
   }
}






