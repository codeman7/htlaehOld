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
   
   class func from(_ int: Int) -> Date {
      
      let str: String = "\(int)"
      return str.date()
      
   }
   
   static func dateFrom(year: Int, month: Int, day: Int) -> Foundation.Date {
      // Create a calendar and date compoent
      let cal: Calendar = Calendar.current
      var comp: DateComponents = DateComponents()
      // Set the date and year for the compoents
      comp.year = (year < 2000) ? year + 2000 : year
      comp.month = month
      comp.day = day
      // Create the date and return it
      return cal.date(from: comp)!
      
   }
   
   func toString() -> String {
      
      // Create a component variable
      let comp: DateComponents = (cal as NSCalendar).components([.year, .month, .day], from: ((((((self as Date) as Date) as Date) as Date) as Date) as Date) as Date)
      // Get the year, month, and day strings
      let year: String = "\(comp.year! - 2000)"
      let month: String = (comp.month! > 9) ? "\(comp.month)" : "0\(comp.month)"
      let day: String = (comp.day! > 9) ? "\(comp.day)" : "0\(comp.day)"
      return "\(year)\(month)\(day)"
      
   }
   
   fileprivate func getLastSunday() -> Foundation.Date {
      // Get the current day of the week
      let day = self.dayOfWeek()
      // Get the difference between that day and sunday and wrap it in a double
      let difference: Double = Double(day - 1)
      // Return the new date
      return ((((((self.addingTimeInterval(60 * 60 * 24 * -difference) as Date) as Date) as Date) as Date) as Date) as Date) as Date
      
   }
   
   fileprivate func getSaturdayFrom(sunday: Foundation.Date) -> Foundation.Date {
      
      // Add 6 days to the sunday date and return it
      return sunday.addingTimeInterval(60 * 60 * 24 * 6)
      
   }
   
   fileprivate func back(weeks: Double, from date: Foundation.Date) -> Foundation.Date {
      
      return date.addingTimeInterval(60 * 60 * 24 * -7 * weeks)
      
   }
   
   fileprivate func getSundaysFrom(firstSunday first: Foundation.Date, to last: Foundation.Date) -> [Int] {
      // Get the sunday taht we start with
      let startDate: Int = Int.from(last)
      // Create a variable to hold the iterations
      var iteration: Int = 0
      // Create the first sunday from tuple
      let firstSunday: Foundation.Date = last.getLastSunday()
      // Create the array for the sundays
      var sundays: [Int] = []
      // Variable to hold date currently on
      var holder: Int = startDate
      // Iterate over the array going back a week at a time adding the date
      repeat {
         // Go back "x" weeks
         let nextSunday: Int = Int.from(back(weeks: Double(iteration), from: firstSunday))
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
   
   func getWeeksBetween(start: Foundation.Date, andEnd end: Foundation.Date) -> [(sun: Int, sat: Int)] {
      
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
   
   fileprivate func nextSaturday() -> Date {
      let comp: DateComponents = DateComponents()
      (comp as NSDateComponents).setValue(6, forComponent: .day)
      return (cal as NSCalendar).date(byAdding: comp, to: ((((((self as Date) as Date) as Date) as Date) as Date) as Date) as Date, options: [])!
      
   }
   
}

// MARK: Extension for Int
extension Int {
   static func from(_ date: Foundation.Date) -> Int {
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
      let cal: Calendar = Date().cal as Calendar
      // Create a dates component variable and set the year, month, day
      var comp: DateComponents = DateComponents()
      comp.year = components.year
      comp.month = components.month
      comp.day = components.day
      
      return cal.date(from: comp)! as Date
   }
   
   static func from(_ date: Date) -> String {
      // Create a calendar object and a compoents object
      let cal: Calendar = Calendar.current
      let comp: DateComponents = (cal as NSCalendar).components([.year, .month, .day], from: ((((((date as Date) as Date) as Date) as Date) as Date) as Date) as Date)
      // Get the year, month, & day strings
      let year: String = "\(comp.year! - 2000)"
      let month: String = (comp.month! > 9) ? "\(comp.month)" : "0\(comp.month)"
      let day: String = (comp.day! > 9) ? "\(comp.day)" : "0\(comp.day)"
      return "\(year)\(month)\(day)"
   }
   
}






