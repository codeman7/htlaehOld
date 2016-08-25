//
//  SearchStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/17/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct SearchStandardViews : ViewsStruct {
   /// The variable for the controller
   let controller: Search
   /// The variable for the views delays and alpha's
   var views: [UIView : (delay: Double, alpha: CGFloat)] = [:]
   
   /// The intiailizer for the menu
   init<T : Controller>(controller: T) {
      self.controller = controller as! Search
   }
   
   mutating func layoutViews() {
      // Get the header and add it to the views array
      let header: BoldHeader = self.controller.header
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Make sure their are suggestions or return
      guard RealmQuery().all.isEmpty == false else {
      
         self.addWorkoutLayout()
         return
      }
      
      // Get the label and add it to the views array
      let label: UILabel = self.createSuggestionsLabel()
      self.views[label] = (delay: 0.025, alpha: 0.38)
      
      // Get the suggestions and add them to the views array
      let suggestions: SuggestionsTable = self.controller.suggestionsTable
      self.views[suggestions] = (delay: 0.025, alpha: 1.0)
      
   }
   
   /**
    This function creates the header for the VC
   */
   func createHeader() -> BoldHeader {
      
      // Set the frame for the header and the options for the header
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 80)
      let options: HeaderType = HeaderType.search(controller: self.controller)
      
      // Create the header and add it to the subview
      let header: BoldHeader = BoldHeader(frame: frame, options: options)
      self.controller.view.addSubview(header)
      // Add the search bar to the header
      header.addSearchBar(self.controller)
      header.searchBar?.becomeFirstResponder()
      
      // Set the header's alpha to 0 and return it
      header.alpha = 0.0
      return header
      
   }
   
   /**
      This function creates the suggestions label
   */
   func createSuggestionsLabel() -> UILabel {
      
      // Set the frame for the label and create the label
      let frame: Rect = Rect(x: 16, y: 84, w: self.controller.width - 32, h: 21)
      let label: UILabel = UILabel(frame: frame, font: Fonts.Regular.sixteen, align: .Left, color: .black)
      
      // Set the labels alpha and it's text value
      label.alpha = 0.38
      label.text = "Suggestions"
      
      // Add the label to the view and return it
      self.controller.view.addSubview(label)
      return label
      
      
   }
   
   func createSuggestions() -> SuggestionsTable {
      
      // Create the frame for the table and the table itself
      let frame: Rect = Rect(x: 0, y: 105, w: self.controller.width, h: CGFloat(self.controller.suggestions.count * 56))
      let table: SuggestionsTable = SuggestionsTable(frame: frame, style: .Plain, controller: self.controller)
      
      // Add the table as a subview and set it's alpha to 0
      self.controller.view.addSubview(table)
      table.alpha = 0.0
      
      // Return the table
      return table
      
   }
   
   
   /**
      This function creates a view that suggest that the User add their first workout
   */
   mutating func addWorkoutLayout() {
      
      // Hide the keyboard
      self.controller.view.endEditing(true)
      self.controller.resignFirstResponder()
      // Update the header
      self.updateHeader()
      
      let bigLabel: UILabel = self.createBigLabel()
      self.views[bigLabel] = (delay: 0.025, alpha: HomeLabel.bigLabel.alpha)
      
      let message: UILabel = self.createLittleLabel()
      self.views[message] = (delay: 0.05, alpha: HomeLabel.message.alpha)
      
      let button: Button = self.createNewWorkoutButton()
      self.views[button] = (delay: 0.075, alpha: 1.0)
      
   }
   
   /**
      This function updates the header to look how it should look when no workouts are present
   */
   private func updateHeader() {
      
      // Update the title to be visable, hide the search bar and bottom line
      self.controller.header.title.alpha = 0.87
      self.controller.header.searchBar?.removeFromSuperview()
      self.controller.header.bottomLine.removeFromSuperview()
      
   }
   
   /**
 
   */
   private func createBigLabel() -> UILabel {
      
      // Set the frame for the label and create the label
      let frame: Rect = Rect(x: self.controller.width / 2 - 150, y: 196, w: 300, h: 48)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.bigLabel)
      
      // Set the labels text and alpha
      label.text = "No Workouts"
      label.alpha = 0.0
      
      // Add the label as a subview and return it
      self.controller.view.addSubview(label)
      return label
      
   }
   
   
   /**
 
   */
   private func createLittleLabel() -> UILabel {
      
      // Set the frame for the label and create the label
      let frame: Rect = Rect(x: self.controller.width / 2 - 102, y: 260, w: 204, h: 96)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.message)
      
      // Set the labels text and alpha
      label.text = "You have not created any workouts yet, let's go create one."
      label.alpha = 0.0
      
      // Set the label to mutliple lines
      label.multipleLines()
      
      // Add the label as a subview and return it
      self.controller.view.addSubview(label)
      return label
      
   }
   
   /**
    
   */
   private func createNewWorkoutButton() -> Button {
      
      // Create the frame for the button and create the button
      let frame: Rect = Rect(x: self.controller.width / 2 - 62, y: 360, w: 124, h: 40)
      let button: Button = Button(frame: frame, type: .Raised)
      
      // Add the title and set the background color for the button
      button.set(title: "NEW WORKOUT", color: .white)
      button.backgroundColor = .blue
      
      // Set the buttons alpha and action
      button.alpha = 0.0
      button.action = { self.controller.newWorkout() }
      
      // Return the button and add it as a subview
      self.controller.view.addSubview(button)
      return button
      
   }
   
}