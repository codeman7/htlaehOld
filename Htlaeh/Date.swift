//
//  Date.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/16/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

typealias Date = Foundation.Date
extension Date {
   
   var cal: Calendar {
      return Calendar.current
   }
   
   var day: Int {
      let cal = Calendar.current
      let comp = (cal as NSCalendar).component(.day, from: self)
      return comp
   }
   
   var month: Int {
      let cal = Calendar.current
      let comp = (cal as NSCalendar).component(.month, from: self)
      return comp
   }
   
   var year: Int {
      let cal = Calendar.current
      let comp = (cal as NSCalendar).component(.year, from: self)
      return comp
   }
   
   func today() -> String {
      
      let cal = Calendar.current
      let components = (cal as NSCalendar).components([.year, .month, .day], from: self)
      let year = self.currentYear(components)
      let month = self.currentMonth(components)
      let day = self.currentDay(components)
      return "\(year)\(month)\(day)"
      
   }
   
   func currentYear(_ comp: DateComponents) -> String {
      
      let year = comp.year! - 2000
      return "\(year)"
      
   }
   
   func currentMonth(_ comp: DateComponents) -> String {
      
      let month = comp.month
      guard month! > 9 else {
         return "0\(month)"
      }
      return "\(month)"
   }
   
   func currentDay(_ comp: DateComponents) -> String {
      
      let day = comp.day
      guard day! > 9 else {
         return "0\(day)"
      }
      return "\(day)"
      
   }
   
   func dateAsString(_ year: Int, month: Int, day: Int) -> String {
      let month: String = self.nameOf(month: month)
      return "\(month) \(day), 20\(year)"
   }
   
   func databaseDateToReadable(_ date: String) -> String {
      
      let year: Int = Int(date[0...1])!
      let month: Int = Int(date[2...3])!
      let day: Int = Int(date[4...5])!
      return self.dateAsString(year, month: month, day: day)
      
   }
   
   func monthAsString() -> String {
      
      let dateFormatter: DateFormatter = DateFormatter()
      let month = dateFormatter.monthSymbols
      return month![self.month - 1]
      
   }
   
   /**
      This function gets the number of days in a month
      - parameter month: The month that we need to know the days for
      - parameter year: The year that the month is in
      - returns: The number of days in the month
   */
   func daysIn(month: Int, year: Int) -> Int {
      // Create a date component
      var dateComponent: DateComponents = DateComponents()
      // Set the date components year
      dateComponent.year = year
      // Set the date components month
      dateComponent.month = month
      // Create a calendar
      let cal: Calendar = Calendar.current
      // Create a date
      let date: Foundation.Date = cal.date(from: dateComponent)!
      // Get the range
      let range = (cal as NSCalendar).range(of: .day, in: .month, for: date)
      // Return the length of the range
      return range.length
   }
   
   /**
      This function returns the day of the week for the first day of the month
      - parameter month: Should be 2 characters long and be the month number for the month we are looking for
      - parameter year: Should be 4 characters long and be the year number for the year we are looking for
      - returns: 0-7 0-> Monday, 7-> Sunday
   */
   func getFirstDayOf(month: String, year: String) -> Int {
      // Create date formatter
      let formatter: DateFormatter = DateFormatter()
      // Set the format for the formatter
      formatter.dateFormat = "yyyy-MM-dd"
      // Set the date to be first day of month
      let date = "\(year)-\(month)-01"
      let firstDay = formatter.date(from: date)
      // Create calendar
      let cal: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
      // Return the weekday
      return (cal as NSCalendar).component(.weekday, from: firstDay!) - 1
      
   }
   
   func dayOfWeek(_ day: Int, inMonth month: Int, year: Int) -> String {
      // Create date formatter
      let formatter: DateFormatter = DateFormatter()
      // Set day format
      formatter.dateFormat = "yyyy-MM-dd"
      // Create date
      let date = "\(year)-\(month)-\(day)"
      // Create day
      let day = formatter.date(from: date)
      // Create calendar
      let cal: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
      // Get day of week in Int
      let dayOfWeek = (cal as NSCalendar).component(.weekday, from: day!)
      // Create dictionary that maps days to string values
      let dayOfWeekDict: [Int: String] = [1:"Sunday", 2: "Monday", 3:"Tuesday", 4:"Wednesday", 5:"Thursday", 6:"Friday", 7:"Saturday"]
      // Return the day
      return dayOfWeekDict[dayOfWeek]!
   }
   
   func dayOfWeek() -> Int {
      
      return (cal as NSCalendar).component(.weekday, from: self)
      
   }
   
   func nameOf(month: Int) -> String {
      
      // Create a day formatter
      let dateFormatter: DateFormatter = DateFormatter()
      // Get the month name
      let monthName: String = dateFormatter.monthSymbols[month - 1]
      // Return the name of the month
      return monthName
      
   }
   
}






