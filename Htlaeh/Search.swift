//
//  Search.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   The view controller for the search VC
*/
class Search : Controller {
   
   // MARK: Properties
   /// The property for the header
   lazy var header: BoldHeader = {
     return SearchStandardViews(controller: self).createHeader()
   }()
   
   /// The property for the suggestion table
   lazy var suggestionsTable: SuggestionsTable = {
      return SearchStandardViews(controller: self).createSuggestions()
   }()
   
   /// The property for the FAB
   lazy var FAB: Button = SearchResultsViews(controller: self).createFAB()
   
   /// Property for the filter
   lazy var filter: SearchFilter = SearchFilter(self)
   
   /// The property for the suggestions
   var suggestions: [String] = RealmQuery().exerciseNames().mostCommon()
   
   var exercise: String? = nil
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func clearedSearch() {
      
      //var views: [UIView] = []
      let views: [UIView] = self.view.subviews.filter({ $0.frame.origin.y != 0 })
      UIView.animateWithDuration(0.15, animations: {
         for v in views {
            v.alpha = 0.0
         }
      })
      
      self.suggestions = RealmQuery().exerciseNames().mostCommon()
      var standard: SearchStandardViews = SearchStandardViews(controller: self)
      standard.layoutViews()
      Delay().delay(0.15, closure: {
         standard.show()
      })
      
      print(self.suggestionsTable.suggestions)
         
   }
   
   func newWorkout() {
      
      // Create the view and add it as a subview
      let blueView: CircularView = CircularView(point: CGPoint(x: self.width / 2 - 1, y: 380), color: .blue)
      self.view.addSubview(blueView)
      
      // Make the view expand
      blueView.grow()
      
      // Delay until the view has expanded 
      let d: Delay = Delay()
      d.delay(0.3, closure: {
         // Hide allsubviews
         for views in self.view.subviews {
            views.removeFromSuperview()
         }
         
      })
      
      // Make the blue view fade
      blueView.hideWithAlpha(0.3)
      
      // Segue
      d.delay(0.3, closure: {
         self.presentViewController(NewWorkout(), animated: false, completion: nil)
      })
      
   }
   
   func showResults(exercise: String) {
      // Get all the views except the header and hide them
      let views: [UIView] = self.view.subviews.filter({ !($0 is BoldHeader) })
      for view in views {
         view.hideWithAlpha()
      }
      
      // Trim down the exercise incase a space was added at the end
      let name = exercise.trimmed()
      
      // Set the exercise property
      self.exercise = name
      
      // Create the struct that will hold all the views
      var loadResults: SearchResultsViews = SearchResultsViews(controller: self, exercise: name)
      
      // Make sure that exercise exist in the database
      guard loadResults.results.isEmpty == false else {
         loadResults.showEmpty(name)
         return
      }
      
      // Layout all the views for that exercise
      loadResults.layoutViews()
      loadResults.show()
      
      
   }
   
   func showAll() {
      self.suggestions = RealmQuery().exerciseNames().mostCommon()
      self.suggestionsTable.suggestions = self.suggestions
   }
   
   func updateSuggestions(exercise: String) {
      
      self.suggestions = RealmQuery().exerciseNames().mostCommonStartsAnd(contains: exercise, caseInsensitve: true)
      self.suggestionsTable.suggestions = self.suggestions
      
   }
   
   func searchFor(exercise: String) {
      
      self.view.endEditing(true)
      self.resignFirstResponder()
      self.header.searchBar?.text = exercise
      self.header.searchBar?.updateText()
      self.showResults(exercise)
      
   }
   
   func showFilter() {
      
      self.filter.showFilter()
      print("Filter down the results")
   }
   
   func refine() {
      
      let rMin = self.filter.sheet.values.rMin
      let rMax = self.filter.sheet.values.rMax
      let wMin = self.filter.sheet.values.wMin
      let wMax = self.filter.sheet.values.wMax
      print("Reps has to be between \(rMin) - \(rMax)\nWeight has to be between \(wMin) - \(wMax)")
      
   }

}

extension Search : ViewSetup {
   
   func setupViews() {
      // Set the background color
      self.view.backgroundColor = .white
      // Get the views from the view struct
      var views: SearchStandardViews = SearchStandardViews(controller: self)
      
      // Add the views to the controller and lay them out
      views.layoutViews()
      views.show()
      
   }
   
}
