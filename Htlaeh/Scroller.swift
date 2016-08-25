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
   Scroller used for all workouts
*/
class Scroller: UIScrollView {
   
   // MARK: Properties
   /// Property for the workouts that will be shown
   let exercise: String?
   
   lazy var workouts: [Workout] = (self.exercise == nil) ? RealmQuery().all : RealmQuery().resultsFor(exercise: self.exercise!)
   /// Property for the weeks that will be shown
   private var weeks: [(sun: Int, sat: Int)] = []
   /// The header that will elevate on scroll
   private let header: BoldHeader
   /// The variable for the y position of the views
   private var yPosition: CGFloat = 0
   /// The variable for to get what workout is at what height
   var workoutPosition: [(date: Int, yPosition: CGFloat)] = []
   
   // MARK: Initializers
   init(frame: CGRect, exercise: String?, header: BoldHeader) {
      
      self.header = header
      self.exercise = exercise
      super.init(frame: frame)
      self.defaultSettings()
      self.addContentFor(exercise: self.exercise)
      // Update the content size
      self.contentSize = CGSize(width: self.frame.width, height: self.yPosition + 72)
      
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
      self.backgroundColor = .white
      // Set the delegate for the scroller
      self.delegate = self
      // Get the first and last date
      let firstDate: Date = self.workouts.first![0].date.date()
      let lastDate: Date = self.workouts.last![0].date.date()
      // Get all the weeks for the workouts and set the content offset
      self.weeks = Date().getWeeksBetween(start: firstDate, andEnd: lastDate).reverse()
      guard self.exercise != nil else {
         self.contentOffset.y = 80
         return
      }
   }
   
   func addContentFor(exercise exercise: String?) {
      
      // Make sure workouts have content
      guard self.workouts.isEmpty == false else {
         return
      }
      
      if exercise != nil {
         // Searching for a specific exercise so add that stats view for that exercise and the all line
         self.addStatsViewFor(exercise: exercise!)
         self.addAllLabel()
      }
      
      // Set the first year, month, and week
      var currentYear: Int = 0
      var currentMonth: Int = 0
      var currentWeek: (sun: Int, sat: Int) = (sun: 0, sat: 0)
      // Varible for what week we are on
      var weekCount: Int = 0
      for a in 0..<workouts.count {
         // Check if year is new
         if workouts[a].date.year != currentYear {
            self.addYearLabelFor(year: workouts[a].date.year)
            currentYear = workouts[a].date.year
         }
         
         // Check if month is new
         if workouts[a].date.month != currentMonth {
            self.addMonthLabelFor(month: workouts[a].date.month)
            currentMonth = workouts[a].date.month
         }
         
         if a == 0 {
            let week: (sun: Int, sat: Int) = self.weeks[weekCount]
            currentWeek = (sun: week.sun, sat: week.sat)
            self.addWeekLabelFor(week: "\(currentWeek.sun.toWeekPresentable()) - \(currentWeek.sat.toWeekPresentable())")
         }
         
         // Check to make sure the week hasn't changed?
         if currentWeek.sun...currentWeek.sat ~= self.workouts[a].date {
            self.add(workout: self.workouts[a])
         } else {
            weekCount += 1
            guard self.weeks.count - 1 >= weekCount else { return }
            let sun: String = self.weeks[weekCount].sun.toWeekPresentable()
            let sat: String = self.weeks[weekCount].sat.toWeekPresentable()
            let week: (sun: Int, sat: Int) = self.weeks[weekCount]
            currentWeek = (sun: week.sun, sat: week.sat)
            self.addWeekLabelFor(week: "\(sun) - \(sat)")
            self.add(workout: self.workouts[a])
         }
      }

      
   }
   
   private func addAllLabel() {
      
      // Create the frame for the line and create the line
      let lineFrame: Rect = Rect(x: self.frame.width / 3, y: self.yPosition + 16, w: self.frame.width / 3, h: 2)
      let line: Line = Line(frame: lineFrame, alpha: 1.0)
      // Set the lines background color and add it to the controller
      line.backgroundColor = .blue
      
      // Create the label and it's frame
      let labelFrame: Rect = Rect(x: self.frame.width / 2 - 100, y: self.yPosition + 30, w: 200, h: 28)
      let label: UILabel = UILabel(frame: labelFrame, properties: Label(color: .black, alpha: 0.54, align: .Center, font: Fonts.Regular.twenty))
      // Set the labels text and add it to the controller
      label.text = "All Sets"
      
      self.addSubview(line)
      self.addSubview(label)
      
      self.yPosition += 72
      
   }
   
   private func addStatsViewFor(exercise exercise: String) {
      
      // Create the frame for the stats view and create the view
      let frame: Rect = Rect(x: 0, y: 1, w: self.frame.w, h: 144)
      
      let data: StatsViewData = RealmQuery().statsFor(exercise: exercise)
      let statsView: StatsView = StatsView(frame: frame, data: data)
      // Add the view to the controller and return the stats view
      self.addSubview(statsView)
      
      // Update the y Position
      self.yPosition += 144
      
      
   }
   
   private func addYearLabelFor(year year: Int) {
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: self.yPosition, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: .yellow)
      self.addSubview(line)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: self.yPosition + 14, w: 100, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = "20\(year)"
      self.addSubview(label)
      
      // Update the yPosition
      self.yPosition += 46
      
   }
   
   private func addMonthLabelFor(month month: Int) {
      
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: self.yPosition, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: .blue)
      self.addSubview(line)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: self.yPosition + 14, w: 100, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = "\(Date().nameOf(month: month))"
      self.addSubview(label)
      
      // Update the yPosition
      self.yPosition += 46
      
   }
   
   private func addWeekLabelFor(week week: String) {
      
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: self.yPosition, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: .red)
      self.addSubview(line)
      
      // Create the label and add it
      let weekLabelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: self.yPosition + 14, w: 100, h: 19)
      let weekLabel: UILabel = UILabel(frame: weekLabelFrame, properties: ScrollerLabel())
      weekLabel.text = "Week of"
      weekLabel.alpha = 0.38
      self.addSubview(weekLabel)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 240) / 2, y: self.yPosition + 41, w: 240, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = week
      self.addSubview(label)
      
      // Update the yPosition
      self.yPosition += 73
      
   }
   
   private func add(workout workout: Workout) {
      // Add the workout and it's yPosition to the workout position array
      self.workoutPosition += [(date: workout.date, yPosition: self.yPosition)]
      
      // Create the frame for the table and create the table
      let tableFrame: CGRect = CGRect(x: 0, y: self.yPosition, w: self.frame.w, h: CGFloat(workout.sets.count + 1) * 48)
      let table: AllWorkoutsTable = AllWorkoutsTable(frame: tableFrame, style: .Plain, workout: workout)
      
      // Add the table to view
      self.addSubview(table)
      
      // Update the yPosition
      self.yPosition += tableFrame.h + 16
   }
   
   
}

// MARK: Delegate methods
extension Scroller : UIScrollViewDelegate {
   
   // TODO: Add scroll
   func scrollViewDidScrollToTop(scrollView: UIScrollView) {
      // Lower the header
   }
   
   func scrollViewDidScroll(scrollView: UIScrollView) {
      // Raise the header based on the amount of scrolling
      if contentOffset.y > 0 {
         header.elevate(4.0)
      } else {
         header.elevate(0.0)
      }
   }
   
}






