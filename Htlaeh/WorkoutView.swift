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
      self.backgroundColor = Color().white
      
   }
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function adds the workout to the view by calling all the other methods
   */
   func add<A: WorkoutType>(workout workout: A) {
      
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
      dateLabel.text = date
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
   private func addTable(workout workout: WorkoutType) {
      
      
      
   }
   
   /// This function adds the execise header to the exercise column
   private func addExerciseHeader() {
      
      // Create the settings for the label
      let exerciseProperties: WorkoutTableColumnHeadString = WorkoutTableColumnHeadString()
      // Set the width of the label
      let width: CGFloat = "Exercise".widthWithConstrainedHeight(16, font: exerciseProperties.font)
      // Create the frame for the label
      let exerciseFrame: Rect = Rect(x: 16, y: 29, w: width, h: 16)
      // Create the label
      let exerciseLabel: UILabel = UILabel(frame: exerciseFrame, properties: exerciseProperties)
      // Set the labels text
      exerciseLabel.text = "Exercise"
      // Add the label to the view
      self.addSubview(exerciseLabel)
      
   }
   
   /// This function adds the reps header to the reps column
   private func addRepsHeader() {
      
      // Create the settings for the label
      let exerciseProperties: WorkoutTableColumnHeadString = WorkoutTableColumnHeadString()
      // Set the width of the label
      let width: CGFloat = "Exercise".widthWithConstrainedHeight(16, font: exerciseProperties.font)
      // Create the frame for the label
      let exerciseFrame: Rect = Rect(x: 16, y: 29, w: width, h: 16)
      // Create the label
      let exerciseLabel: UILabel = UILabel(frame: exerciseFrame, properties: exerciseProperties)
      // Set the labels text
      exerciseLabel.text = "Exercise"
      // Add the label to the view
      self.addSubview(exerciseLabel)
      
   }
   
   /// This function adds the weight header to the weight column
   private func addWeightHeader() {
      
      
      
   }
}





