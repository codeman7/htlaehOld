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
      self.register(SuggestionCell.self, forCellReuseIdentifier: "Cell")
      
      // Set the data source and delegate
      self.dataSource = self
      self.delegate = self
      
      // Set the row height
      self.rowHeight = 56.0
      
      // Set the seperator style
      self.separatorStyle = .none
   }
   
}

extension SuggestionsTable : UITableViewDelegate {
 
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      // Get the cell
      let cell = tableView.cellForRow(at: indexPath) as! SuggestionCell
      // Search for the title of the cell that was selected
      self.controller.searchFor(cell.title!.text!)
      
   }
   
}

extension SuggestionsTable : UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: SuggestionCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SuggestionCell
      cell.add(suggestions[(indexPath as NSIndexPath).row])
      return cell
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.suggestions.count
   }
   
}
