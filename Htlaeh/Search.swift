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
   
   // The property for the suggestions
   var suggestions: [String] {
      return RealmQuery().suggestionsFor(text: self.header.searchBar!.text!)
   }
   
   
   
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func newWorkout() {
      
      // Create the view and add it as a subview
      let blueView: CircularView = CircularView(point: CGPoint(x: self.width / 2 - 1, y: 380), color: Color().blue)
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
   
   func showResults() {
      
      let views: [UIView] = self.view.subviews.filter({ !($0 is BoldHeader) })
      for view in views {
         view.hideWithAlpha()
      }
      var loadResults: SearchResultsViews = SearchResultsViews(controller: self)
      loadResults.layoutViews()
      loadResults.show()
      
      
   }
   
   func filter() {
      print("Filter down the results")
   }

}

extension Search : ViewSetup {
   
   func setupViews() {
      print("Fix search")
      // Set the background color
      self.view.backgroundColor = Color().white
      // Get the views from the view struct
//      var views: SearchStandardViews = SearchStandardViews(controller: self)
      var views: SearchResultsViews = SearchResultsViews(controller: self)
      // Add the views to the controller and lay them out
      self.header.alpha = 1.0
      self.header.title.alpha = 0.87
      self.header.searchBar?.removeFromSuperview()
      self.header.bottomLine.removeFromSuperview()
      views.layoutViews()
      views.show()
      
   }
   
}