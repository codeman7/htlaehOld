//
//  WorkoutTable.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/19/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class should be used to create the table that holds all the workouts
 */
class AllWorkoutsTable : UITableView {
   
   // MARK: Properties
   var workout: Workout
   
   // MARK: Initializers
   /**
    Default initializer
   */
   init(frame: CGRect, style: UITableViewStyle, workout: Workout) {
      // Set the workout property
      self.workout = workout
      // Call the super initializer
      super.init(frame: frame, style: style)
      // Set up the default settings for the table
      self.defaultSettings()
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   func defaultSettings() {
      
      // Register teh cells
      self.registerClass(WorkoutCell.self, forCellReuseIdentifier: "Cell")
      self.registerClass(WorkoutCellHeader.self, forCellReuseIdentifier: "Header")
      // Set the data source and delegate
      self.dataSource = self
      self.delegate = self
      // Set the seperator color and alpha
      self.separatorColor = Color().black.colorWithAlphaComponent(0.14)
      
   }
   
}


// MARK: Make the table conform to the data source protocol
extension AllWorkoutsTable : UITableViewDataSource {
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
      let cell: UITableViewCell
      if indexPath.row == 0 {
         // Create the cell and add the data
         let workoutCell = tableView.dequeueReusableCellWithIdentifier("Header", forIndexPath: indexPath) as! WorkoutCellHeader
         let date: String = Date().databaseDateToReadable(self.workout.sets[0].date)
         workoutCell.add(date: date)
         workoutCell.addHeaders()
         cell = workoutCell
      } else {
         // Create the cell and determine what set to show the data for
         let workoutCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WorkoutCell
         let weightSet: WeightSet = self.workout.sets[indexPath.row]
         // Add the data and return the cell
         workoutCell.addTitlesFor(set: weightSet)
         cell = workoutCell
      }
      
      return cell
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return self.workout.sets.count + 1
      
   }
   
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
      return 1
      
   }
   
  
   
}

// MARK: Make the tabel conform to the delegate protocol
extension AllWorkoutsTable : UITableViewDelegate {
   
   
}






