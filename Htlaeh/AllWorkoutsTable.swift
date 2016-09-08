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
      self.register(WorkoutCell.self, forCellReuseIdentifier: "Cell")
      self.register(WorkoutCellHeader.self, forCellReuseIdentifier: "Header")
      // Set the data source and delegate
      self.dataSource = self
      self.delegate = self
      self.rowHeight = 48.0
      // Set the seperator color and alpha
      self.separatorColor = UIColor.black.withAlphaComponent(0.14)
      
   }
   
}


// MARK: Make the table conform to the data source protocol
extension AllWorkoutsTable : UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell: UITableViewCell
      if (indexPath as NSIndexPath).row == 0 {
         // Create the cell and add the data
         let workoutCell = tableView.dequeueReusableCell(withIdentifier: "Header", for: indexPath) as! WorkoutCellHeader
         let date: String = Date().databaseDateToReadable(self.workout[0].date)
         workoutCell.add(date: date)
         workoutCell.addHeaders()
         cell = workoutCell
      } else {
         // Create the cell and determine what set to show the data for
         let workoutCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkoutCell
         
         let weightSet: WeightSet = self.workout[(indexPath as NSIndexPath).row - 1]
         // Add the data and return the cell
         workoutCell.addTitlesFor(set: weightSet)
         cell = workoutCell
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return self.workout.sets.count + 1
      
   }
   
}

// MARK: Make the tabel conform to the delegate protocol
extension AllWorkoutsTable : UITableViewDelegate {
   
   
}






