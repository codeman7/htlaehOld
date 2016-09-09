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
      return str.date()
      
   }
   
   static func dateFrom(year: Int, month: Int, day: Int) -> Date {
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
      let comp: NSDateComponents = cal.components([.Year, .Month, .Day], fromDate: Date())
      // Get the year, month, and day strings
      let year: String = "\(comp.year - 2000)"
      let month: String = (comp.month > 9) ? "\(comp.month)" : "0\(comp.month)"
      let day: String = (comp.day > 9) ? "\(comp.day)" : "0\(comp.day)"
      return "\(year)\(month)\(day)"
      
   }
   
   private func getLastSunday() -> Date {
      // Get the current day of the week
      let day = self.dayOfWeek()
      // Get the difference between that day and sunday and wrap it in a double
      let difference: Double = Double(day - 1)
      // Return the new date
      return self.dateByAddingTimeInterval(60 * 60 * 24 * -difference)
      
   }
   
   private func getSaturdayFrom(sunday: Date) -> Date {
      
      // Add 6 days to the sunday date and return it
      return sunday.dateByAddingTimeInterval(60 * 60 * 24 * 6)
      
   }
   
   private func back(weeks: Double, from date: Date) -> Date {
      
      return date.dateByAddingTimeInterval(60 * 60 * 24 * -7 * weeks)
      
   }
   
   private func getSundaysFrom(firstSunday first: Date, to last: Date) -> [Int] {
      // Get the sunday taht we start with
      let startDate: Int = Int.from(last)
      // Create a variable to hold the iterations
      var iteration: Int = 0
      // Create the first sunday from tuple
      let firstSunday: Date = last.getLastSunday()
      // Create the array for the sundays
      var sundays: [Int] = []
      // Variable to hold date currently on
      var holder: Int = startDate
      // Iterate over the array going back a week at a time adding the date
      repeat {
         // Go back "x" weeks
         let nextSunday: Int = Int.from(back(Double(iteration), from: firstSunday))
         // Add the current sunday to the sundays array
         sundays += [nextSunday]
         // Step up the iteration
         iteration += 1
         // Update the holder
         holder = nextSunday
         // Make sure the holder is bigger than the first sunday
      } while holder > Int.from(first)
      
      print(sundays)
      // Return all the sundays
      return sundays
      
   }
   
   func getWeeksBetween(start: NSDate, andEnd end: NSDate) -> [(sun: Int, sat: Int)] {
      
      // Create array of tuples that will be returned
      var weeks: [(sun: Int, sat: Int)] = []
      // Get sundays
      let sundays: [Int] = self.getSundaysFrom(firstSunday: start, to: end)
      // Iterate over the sundays
      for sunday in sundays {
         // Create the date from sunday
         let date: Date = Date.from(sunday)
         // Get saturday from current sunday
         let saturday: Int = Int.from(((((((date.nextSaturday() as Date) as Date) as Date) as Date) as Date) as Date) as Date)
         // Create a tuple for current week
         let week: (sunday: Int, saturday: Int) = (sunday: sunday, saturday: saturday)
         
         // Add the week to the weeks array
         weeks += [week]
      }
      // Return the weeks array
      return weeks
   }
   
   private func nextSaturday() -> Date {
      let comp: NSDateComponents = NSDateComponents()
      comp.setValue(6, forComponent: .Day)
      return cal.dateByAddingComponents(comp, toDate: self, options: [])!
      
   }
   
}

// MARK: Extension for Int
extension Int {
   static func from(date: Date) -> Int {
      return Int(String.from(date as Date))!
   }
}

// MARK: Extension for String
extension String {

   func dateComponents() -> (year: Int, month: Int, day: Int) {
      
      // Convert to string
      let i: Int = Int(self)!
      // Get the year, month, day
      let year: Int = i / 10000
      let month: Int = (i - (year * 10000)) / 100
      let day: Int = i % 100
      // Return tuple
      return (year: year + 2000, month: month, day: day)
      
   }
   
   func date() -> Date {
      
      // Get the compoents and create a calendar
      let components = self.dateComponents()
      let cal: NSCalendar = Date().cal as NSCalendar
      // Create a dates component variable and set the year, month, day
      let comp: NSDateComponents = NSDateComponents()
      comp.year = components.year
      comp.month = components.month
      comp.day = components.day
      
      return cal.dateFromComponents(comp)!
   }
   
   static func from(date: Date) -> String {
      // Create a calendar object and a compoents object
      let cal: NSCalendar = NSCalendar.currentCalendar()
      let comp: NSDateComponents = cal.components([.Year, .Month, .Day], fromDate: date)
      // Get the year, month, & day strings
      let year: String = "\(comp.year - 2000)"
      let month: String = (comp.month > 9) ? "\(comp.month)" : "0\(comp.month)"
      let day: String = (comp.day > 9) ? "\(comp.day)" : "0\(comp.day)"
      return "\(year)\(month)\(day)"
   }
   
}






