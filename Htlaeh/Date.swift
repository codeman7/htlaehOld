//
//  Date.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/16/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

typealias Date = NSDate
extension Date {
   
   var cal: NSCalendar {
      return NSCalendar.currentCalendar()
   }
   
   var day: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Day, fromDate: self)
      return comp
   }
   
   var month: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Month, fromDate: self)
      return comp
   }
   
   var year: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Year, fromDate: self)
      return comp
   }
   
   func today() -> String {
      
      let cal = NSCalendar.currentCalendar()
      let components = cal.components([.Year, .Month, .Day], fromDate: self)
      let year = self.currentYear(components)
      let month = self.currentMonth(components)
      let day = self.currentDay(components)
      return "\(year)\(month)\(day)"
      
   }
   
   func currentYear(comp: NSDateComponents) -> String {
      
      let year = comp.year - 2000
      return "\(year)"
      
   }
   
   func currentMonth(comp: NSDateComponents) -> String {
      
      let month = comp.month
      guard month > 9 else {
         return "0\(month)"
      }
      return "\(month)"
   }
   
   func currentDay(comp: NSDateComponents) -> String {
      
      let day = comp.day
      guard day > 9 else {
         return "0\(day)"
      }
      return "\(day)"
      
   }
   
   func dateAsString(year: Int, month: Int, day: Int) -> String {
      let month: String = self.nameOf(month: month)
      return "\(month) \(day), 20\(year)"
   }
   
   func databaseDateToReadable(date: String) -> String {
      
      let year: Int = Int(date[0...1])!
      let month: Int = Int(date[2...3])!
      let day: Int = Int(date[4...5])!
      return self.dateAsString(year, month: month, day: day)
      
   }
   
   func monthAsString() -> String {
      
      let dateFormatter: NSDateFormatter = NSDateFormatter()
      let month = dateFormatter.monthSymbols
      return month[self.month - 1]
      
   }
   
   /**
      This function gets the number of days in a month
      - parameter month: The month that we need to know the days for
      - parameter year: The year that the month is in
      - returns: The number of days in the month
   */
   func daysIn(month month: Int, year: Int) -> Int {
      // Create a date component
      let dateComponent: NSDateComponents = NSDateComponents()
      // Set the date components year
      dateComponent.year = year
      // Set the date components month
      dateComponent.month = month
      // Create a calendar
      let cal: NSCalendar = NSCalendar.currentCalendar()
      // Create a date
      let date: NSDate = cal.dateFromComponents(dateComponent)!
      // Get the range
      let range = cal.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
      // Return the length of the range
      return range.length
   }
   
   /**
      This function returns the day of the week for the first day of the month
      - parameter month: Should be 2 characters long and be the month number for the month we are looking for
      - parameter year: Should be 4 characters long and be the year number for the year we are looking for
      - returns: 0-7 0-> Monday, 7-> Sunday
   */
   func getFirstDayOf(month month: String, year: String) -> Int {
      // Create date formatter
      let formatter: NSDateFormatter = NSDateFormatter()
      // Set the format for the formatter
      formatter.dateFormat = "yyyy-MM-dd"
      // Set the date to be first day of month
      let date = "\(year)-\(month)-01"
      let firstDay = formatter.dateFromString(date)
      // Create calendar
      let cal: NSCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
      // Return the weekday
      return cal.component(.Weekday, fromDate: firstDay!) - 1
      
   }
   
   func dayOfWeek(day: Int, inMonth month: Int, year: Int) -> String {
      // Create date formatter
      let formatter: NSDateFormatter = NSDateFormatter()
      // Set day format
      formatter.dateFormat = "yyyy-MM-dd"
      // Create date
      let date = "\(year)-\(month)-\(day)"
      // Create day
      let day = formatter.dateFromString(date)
      // Create calendar
      let cal: NSCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
      // Get day of week in Int
      let dayOfWeek = cal.component(.Weekday, fromDate: day!)
      // Create dictionary that maps days to string values
      let dayOfWeekDict: [Int: String] = [1:"Sunday", 2: "Monday", 3:"Tuesday", 4:"Wednesday", 5:"Thursday", 6:"Friday", 7:"Saturday"]
      // Return the day
      return dayOfWeekDict[dayOfWeek]!
   }
   
   func dayOfWeek() -> Int {
      
      return cal.component(.Weekday, fromDate: self)
      
   }
   
   func nameOf(month month: Int) -> String {
      
      // Create a day formatter
      let dateFormatter: NSDateFormatter = NSDateFormatter()
      // Get the month name
      let monthName: String = dateFormatter.monthSymbols[month - 1]
      // Return the name of the month
      return monthName
      
   }
   
}






