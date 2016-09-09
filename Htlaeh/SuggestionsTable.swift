//
//  SuggestionsTable.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/24/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class SuggestionsTable : UITableView {
   // MARK: Properties
   /// The suggestions that the table will have
   var suggestions: [String] {
      set {
         self.reloadData()
      }
      
      get {
         return self.controller.suggestions
      }
   }
   
   /// The controller that will hold the table
   var controller: Search
   
   // MARK: Initializers
   init(frame: CGRect, style: UITableViewStyle, controller: Search) {
      
      // Set the properties
      self.controller = controller
      // Call the super initializer
      super.init(frame: frame, style: style)
      // Set up the default settins
      self.defaultSettings()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }

   
   // MARK: Functions
   func defaultSettings() {
      
      // Register the cells
      self.registerClass(SuggestionCell.self, forCellReuseIdentifier: "Cell")
      
      // Set the data source and delegate
      self.dataSource = self
      self.delegate = self
      
      // Set the row height
      self.rowHeight = 56.0
      
      // Set the seperator style
      self.separatorStyle = .None
   }
   
}

extension SuggestionsTable : UITableViewDelegate {
 
   func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
      
      // Get the cell
      let cell = tableView.cellForRowAtIndexPath(indexPath) as! SuggestionCell
      // Search for the title of the cell that was selected
      self.controller.searchFor(cell.title!.text!)
      
   }
   
}

extension SuggestionsTable : UITableViewDataSource {
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell: SuggestionCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SuggestionCell
      cell.add(suggestions[(indexPath as NSIndexPath).row])
      return cell
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.suggestions.count
   }
   
}
