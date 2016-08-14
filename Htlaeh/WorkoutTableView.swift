//
//  WorkoutTableView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used to create a table of workout table cells
 */
class WorkoutTableView : UIView {
   
   // MARK: Properties
   let workout: Workout
   
   // MARK: Initializers
   init(frame: CGRect, workout: Workout) {
      // Set the workout property
      self.workout = workout
      // Call the super initializer
      super.init(frame: frame)
      // Add the top line
      self.addTopLine()
      // Layout the cells
      self.addCells()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
       This function adds the top line to the view
   */
   func addTopLine() {
      // Create the frame for the line
      let frame: Rect = Rect(x: 0, y: 0, width: self.frame.w, height: 1)
      // Create the line
      let line: Line = Line(frame: frame, alpha: 0.14)
      // Add the line to the view
      self.addSubview(line)
      
   }
   
   /**
      This function adds all the cells to the view
   */
   func addCells() {
      // Iterate over all the sets in the workout
      for a in 0..<self.workout.count {
         // Create the frame
         let frame: (y: CGFloat, width: CGFloat) = (y: CGFloat(a * 48) + 1, width: self.frame.w)
         let exercise: String = self.workout.sets[a].name
         let reps: Int = Int(self.workout.sets[a].reps!)
         let weight: Int = Int(self.workout.sets[a].weight!)
         let titles: [String] = [exercise, "\(reps)", "\(weight)"]
         // Create the cell
         let cell: WorkoutTableCell = WorkoutTableCell(frame: frame, titles: titles)
         // Add the cell to the view
         self.addSubview(cell)
         
      }
      
   }
   
   /**
      This function gets all the titles for the workout table cell
      - parameter set: The set of the workout that we need the titles for
      - returns: An array of strings containting the 0-Exercise name, 1-Reps, 2-Weight
   */
   private func getTitlesFor(set set: Int) -> [String] {
      
      //let exercise: String = self.workout.sets[set].exerciseName
      //let reps: String = "\(self.workout.sets[set].reps!)"
      //let weight: String = "\(self.workout.sets[set].weight!)"
      return ["Squat", "8", "135"]
      //return [exercise, reps, weight]
      
   }
   
}