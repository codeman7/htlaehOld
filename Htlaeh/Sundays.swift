//
//  Sundays.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/22/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation


// MARK: Extension for Date
extension Date {
   
   class func from(int: Int) -> Date {
      
      let str: String = "\(int)"
      return str.toDate()
      
   }
   
   static func dateFrom(year year: Int, month: Int, day: Int) -> NSDate {
      // Create a calendar and date compoent
      let cal: NSCalendar = NSCalendar.currentCalendar()
      let comp: NSDateComponents = NSDateComponents()
      // Set the date and year for the compoents
      comp.year = (year < 2000) ? year + 2000 : year
      comp.month = month
      comp.day = day
      // Create the date and return it
      return cal.dateFromComponents(comp)!
      
   }
   
   func toString() -> String {
      
      // Create a component variable
      let comp: NSDateComponents = cal.components([.Year, .Month, .Day], fromDate: self)
      // Get the year, month, and day strings
      let year: String = "\(comp.year - 2000)"
      let month: String = (comp.month > 9) ? "\(comp.month)" : "0\(comp.month)"
      let day: String = (comp.day > 9) ? "\(comp.day)" : "0\(comp.day)"
      return "\(year)\(month)\(day)"
      
   }
   
   func toInt() -> Int {
      // Wrap the value you get from string
      return Int(self.toString())!
      
   }
   
   private func getLastSunday() -> NSDate {
      // Get the current day of the week
      let day = self.dayOfWeek()
      // Get the difference between that day and sunday and wrap it in a double
      let difference: Double = Double(day - 1)
      // Return the new date
      return self.dateByAddingTimeInterval(60 * 60 * 24 * -difference)
      
   }
   
   private func getSaturdayFrom(sunday sunday: NSDate) -> NSDate {
      
      // Add 6 days to the sunday date and return it
      return sunday.dateByAddingTimeInterval(60 * 60 * 24 * 6)
      
   }
   
   private func back(weeks weeks: Double, from date: NSDate) -> NSDate {
      
      return date.dateByAddingTimeInterval(60 * 60 * 24 * -7 * weeks)
      
   }
   
   private func getSundaysFrom(firstSunday first: NSDate, to last: NSDate) -> [Int] {
      // Get the sunday taht we start with
      let startDate: Int = last.toInt()
      // Create a variable to hold the iterations
      var iteration: Int = 0
      // Create the first sunday from tuple
      let firstSunday: NSDate = first.getLastSunday()
      // Create the array for the sundays
      var sundays: [Int] = []
      // Variable to hold date currently on
      var holder: Int = startDate
      // Iterate over the array going back a week at a time adding the date
      repeat {
         // Go back "x" weeks
         let nextSunday: Int = back(weeks: Double(iteration), from: firstSunday).toInt()
         // Add the current sunday to the sundays array
         sundays += [nextSunday]
         // Step up the iteration
         iteration += 1
         // Update the holder
         holder = nextSunday
         // Make sure the holder is bigger than the first sunday
      } while holder > first.toInt()
      // Return all the sundays
      return sundays
      
   }
   
   func getWeeksBetween(start start: NSDate, andEnd end: NSDate) -> [(sunday: Int, saturday: Int)] {
      
      // Create array of tuples that will be returned
      var weeks: [(sunday: Int, saturday: Int)] = []
      // Get sundays
      let sundays: [Int] = self.getSundaysFrom(firstSunday: start, to: end)
      // Iterate over the sundays
      for sunday in sundays {
         // Create a date tuple
         let dateTuple: (year: Int, month: Int, day: Int) = "\(sunday)".toDateComponents()
         // Create date from components
         let date: NSDate = Date.dateFrom(year: dateTuple.year, month: dateTuple.month, day: dateTuple.day)
         // Get saturday from current sunday
         let saturday: Int = getSaturdayFrom(sunday: date).toInt()
         // Create a tuple for current week
         let week: (sunday: Int, saturday: Int) = (sunday: sunday, saturday: saturday)
         
         // Add the week to the weeks array
         weeks += [week]
      }
      // Return the weeks array
      return weeks
   }
   
   
   
}

// MARK: Extension for String
extension String {

   func toDateComponents() -> (year: Int, month: Int, day: Int) {
      
      // Convert to string
      let i: Int = Int(self)!
      // Get the year, month, day
      let year: Int = i / 10000
      let month: Int = (i - (year * 10000)) / 100
      let day: Int = i % 100
      // Return tuple
      return (year: year + 2000, month: month, day: day)
      
   }
   
   func toDate() -> Date {
      
      // Get the compoents and create a calendar
      let components = self.toDateComponents()
      let cal: NSCalendar = Date().cal
      // Create a dates component variable and set the year, month, day
      let comp: NSDateComponents = NSDateComponents()
      comp.year = components.year
      comp.month = components.month
      comp.day = components.day
      
      return cal.dateFromComponents(comp)!
   }
   
}






