//
//  Array.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/24/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

extension _ArrayType where Generator.Element == String  {
   
   /// Returns the most common elements in an array
   func mostCommon() -> [String] {
      
      // Get the amount of time each element appeared
      let arr = self.frequency().sortByValues(>)
      
      // Return the array
      return self.protectAgainstShort(arr)
      
   }
   
   /**
    Returns an array of the first "n" elements maxing at 5.
    - parameter arr: The array that is being condensed
    */
   private func protectAgainstShort(arr: [String])  -> [String] {
      
      // Create a temporary array
      var _array: [String] = []
      
      // Make sure the arr sent has atleast 5 elements or just return it's element count
      let count: Int = (arr.count > 5) ? 5 : arr.count
      
      // Iterate over the array and add the elements accrodingly
      for a in 0..<count {
         _array += [arr[a]]
      }
      
      // Return the array
      return _array
      
   }
   
   /**
    Returns the most common elements in an array that start with
    - parameter startsWith: The string that the element should start with
    */
   func mostCommon(startsWith prefix: String) -> [String] {
      
      let arr = self.filter({ $0.hasPrefix(prefix) })
      return arr.mostCommon()
      
   }
   
   /**
    Returns the most common elements in an array that either start with given string or contain given string
    
    The elements that start with a certain string are returned first
    - parameter contains: The substring that can be within the element and that the element begins with
    */
   func mostCommonStartsAnd(contains string: String) -> [String] {
      
      var sortedArr = self.frequency().sortByValues(>)
      let arr = sortedArr.filter({ $0.hasPrefix(string) })
      sortedArr.removeSubArray(arr)
      let a = sortedArr.filter({ $0.containsString(string.lowercaseString) })
      return protectAgainstShort(arr + a)
      
   }
   
   /**
    Returns the most common elements in an array that either start with given string or contain given string
    
    The elements that start with a certain string are returned first
    - parameter contains: The substring that can be within the element and that the element begins with
    - parameter caseInsensitive: Weather we case about the case of the string
    */
   func mostCommonStartsAnd(contains string: String, caseInsensitve: Bool) -> [String] {
      
      var sortedArr = (caseInsensitve == true) ? self.ignoreCase().frequency().sortByValues(>) : self.frequency().sortByValues(>)
      let arr = sortedArr.filter({ $0.hasPrefix(string) })
      sortedArr.removeSubArray(arr)
      let a = sortedArr.filter({ $0.containsString(string.lowercaseString) })
      return protectAgainstShort(arr + a)
      
   }
   
   /// Updates all elements to be lower case in the array
   func ignoreCase() -> [String] {
      
      // The array that will be returned
      var array: [String] = []
      
      // Iterate over the array and add all elements to it
      for iteration in 0..<self.count {
         array += [self[iteration].capitalizedString]
      }
      
      // Return the array
      return array
   }
   
   /// This function returns a dictionary of each element and it's occurences
   func frequency() -> [String : Int] {
      
      // Create the dictionary
      var resultsDict: [String : Int] = [:]
      
      // Iterate over the array and insert elements and update their frequency
      for ele in self {
         if resultsDict[ele] == nil {
            resultsDict[ele] = 1
         } else {
            resultsDict[ele]! += 1
         }
      }
      
      // Return the dictionary
      return resultsDict
   }
   
   /// This function removes a sub array of a larger array
   mutating func removeSubArray(array: [String]) {
      // Iterate over all elements in the array parameter
      for object in array {
         // Get the index of the the object
         if let index = self.indexOf(object) {
            // Remove the object
            self.removeAtIndex(index)
         }
      }
      
   }
   
}

