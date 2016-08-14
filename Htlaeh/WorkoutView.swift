//
//  WorkoutView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class WorkoutView : UIView {
   // MARK: Properties
   // MARK: Initializers
   /**
      Default and only initializer
      - parameter frame: The frame that the view will have
   */
   override init(frame: Rect) {
      
      super.init(frame: frame)
      
   }
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function adds the workout to the view by calling all the other methods
   */
   func add(workout workout: Workout) {
      
      guard workout.count != 0 else {
         return
      }
      // Add the date
      self.addDate(workout.sets[0].date)
      // Add the workout header
      self.addWorkoutHeader()
      // Add the table view
      self.addTable(workout: workout)

   }
   
   /**
      This function adds the date of the workout to the view
   */
   private func addDate(date: String) {
      
      // Set the frame for the label
      let labelFrame: CGRect = CGRect(x: 16, y: 0, w: self.frame.w / 2, h: 21)
      // Create the label
      let dateLabel: UILabel = UILabel(frame: labelFrame, properties: WorkoutDateLabel())
      // Set the text for the label
      dateLabel.text = "August 12, 2016"
      // Add the label to the view
      self.addSubview(dateLabel)
      
   }
   
   /**
      This function adds the header labels to the view
   */
   private func addWorkoutHeader() {
      
      // Add the exercise label
      self.addExerciseHeader()
      // Add the reps label
      self.addRepsHeader()
      // Add the weight label
      self.addWeightHeader()
      
   }
   
   /**
      This function adds the table to the view
   */
   private func addTable(workout workout: Workout) {
      
      let frame: CGRect = CGRect(x: 0, y: 49, w: self.frame.w, h: CGFloat(workout.count * 48) + 1)
      let workoutTable: WorkoutTableView = WorkoutTableView(frame: frame, workout: workout)
      self.addSubview(workoutTable)
      
   }
   
   /// This function adds the execise header to the exercise column
   private func addExerciseHeader() {
      
      // Create the settings for the label
      let exerciseProperties: WorkoutTableColumnHeadString = WorkoutTableColumnHeadString()
      // Set the width of the label
      let width: CGFloat = "Exercise".widthWithConstrainedHeight(16, font: exerciseProperties.font)
      // Create the frame for the label
      let frame: Rect = Rect(x: 16, y: 29, w: width, h: 16)
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: exerciseProperties)
      // Set the labels text
      label.text = "Exercise"
      // Add the label to the view
      self.addSubview(label)
      
   }
   
   /// This function adds the reps header to the reps column
   private func addRepsHeader() {
      
      // Create the settings for the label
      let properties: WorkoutTableColumnHeadNumber = WorkoutTableColumnHeadNumber()
      // Create the frame for the label
      let frame: Rect = Rect(x: self.frame.w - 208, y: 29, w: 88, h: 16)
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: properties)
      // Set the labels text
      label.text = "Reps"
      // Add the label to the view
      self.addSubview(label)
      
   }
   
   /// This function adds the weight header to the weight column
   private func addWeightHeader() {
      
      // Create the settings for the label
      let properties: WorkoutTableColumnHeadNumber = WorkoutTableColumnHeadNumber()
      // Create the frame for the label
      let frame: Rect = Rect(x: self.frame.w - 104, y: 29, w: 88, h: 16)
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: properties)
      // Set the labels text
      label.text = "Weight"
      // Add the label to the view
      self.addSubview(label)
      
   }
}





