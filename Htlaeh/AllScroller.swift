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
   var weeks: [(sunday: Int, saturday: Int)] = []
   
   // MARK: Initializers
   init(frame: CGRect, workouts: [Workout]) {
      
      self.workouts = workouts
      super.init(frame: frame)
      self.defaultSettings()
      self.addContent()
      
      
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
      // Get the first and last date
      let firstDate: Date = self.workouts.first!.sets[0].date.toDate()
      let lastDate: Date = self.workouts.last!.sets[0].date.toDate()
      self.weeks = Date().getWeeksBetween(start: firstDate, andEnd: lastDate)
      
      self.contentSize = CGSize(width: self.frame.width, height: 174)
   }
   
   func addContent() {
      var currentYear: Int = 2016
      var currentMonth: Int = 8
      // Add the first year and month labels
      self.addYearLabelFor(year: currentYear, at: 0/*-174*/)
      self.addMonthLabelFor(month: currentMonth, at: 46/*-128*/)
      var sun: String = self.weeks[0].sunday.toWeekPresentable()
      let sat: String = self.weeks[0].saturday.toWeekPresentable()
      self.addWeekLabelFor(week: "\(sun) - \(sat)", at: 94)//-82)
      var currentWeek: (sunday: Int, saturday: Int) = self.weeks[0]
      for workout in workouts {
         
      }
      
   }
   
   private func addYearLabelFor(year year: Int, at y: CGFloat) {
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: y, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: Color().yellow)
      self.addSubview(line)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: y + 14, w: 100, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = "\(year)"
      self.addSubview(label)
      
   }
   
   private func addMonthLabelFor(month month: Int, at y: CGFloat) {
      
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: y, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: Color().blue)
      self.addSubview(line)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: y + 14, w: 100, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = "\(Date().monthNameFor(month: month))"
      self.addSubview(label)
      
   }
   
   private func addWeekLabelFor(week week: String, at y: CGFloat) {
      
      // Create the line and add it as a subview
      let lineFrame: Rect = Rect(x: (self.frame.w - 121) / 2, y: y, w: 121, h: 2)
      let line: Line = Line(frame: lineFrame, color: Color().red)
      self.addSubview(line)
      
      // Create the label and add it
      let weekLabelFrame: Rect = Rect(x: (self.frame.w - 100) / 2, y: y + 14, w: 100, h: 19)
      let weekLabel: UILabel = UILabel(frame: weekLabelFrame, properties: ScrollerLabel())
      weekLabel.text = "Week of"
      weekLabel.alpha = 0.38
      self.addSubview(weekLabel)
      
      // Create the label and add it
      let labelFrame: Rect = Rect(x: (self.frame.w - 240) / 2, y: y + 41, w: 240, h: 16)
      let label: UILabel = UILabel(frame: labelFrame, properties: ScrollerLabel())
      label.text = week
      self.addSubview(label)
      
   }
   
   private func add(workout workout: Workout) {
      
      //let tableFrame: CGRect = CGRect(x: 0, y: 0, w: self.frame.w, h: self.frame.h)
      //let table:
      
   }
   
   
}

// MARK: Delegate methods
extension AllScroller : UIScrollViewDelegate {
   
   // TODO: Add scroll
   
}






