//
//  NavigationBar.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

enum NavigationDestinations {
   
   case Home, NewWorkout, AllWorkouts, Search, Settings
   
}

/**
   This is the UIView subclass that actually holds all the content of the Menu
 */
class NavigationBar: UIView {
   // MARK: Properties
   private let titles: [String] = ["Home", "New Workout", "All Workouts", "Search"]
   private let icons: [UIImage] = [Images.Action().home, Images.Content().add, Images.Action().reorder, Images.Action().search]
   private let desination: [NavigationDestinations] = [.Home, .NewWorkout, .AllWorkouts, .Search]
   private let containingController: Controller
   
   // MARK: Initializer
   //// Designated Initalizers
   init(frame: CGRect, containingController: Controller) {
      // Set the contianing controller
      self.containingController = containingController
      // Call the super initalizers
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = Color().white
      // Add the subviews
      self.addSubviews()
      
   }
   //// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function adds all the subviews to the navigation bar
      I.E. The branding, the buttons to segue , & the settings button
   */
   private func addSubviews() {
      // Add all the branding to the top
      self.addBranding()
      // Add all the buttons
      self.addButtons(icons: self.icons, labels: self.titles)
      // Add the settings button
      self.addSettings()
      
   }
   
   /**
     This function just adds the branding to the Navigation bar
     It adds the logo, the word logo, & the bottom line
   */
   private func addBranding() {
      // The frame for the logo
      let logoFrame: CGRect = CGRect(x: 8, y: 144, width: 60, height: 60)
      // Initialize the logo
      let logo: UIImageView = UIImageView(frame: logoFrame, image: Images.Htlaeh().logoSmooth)
      // Add the logo to the view
      self.addSubview(logo)
      // The frame for the word logo
      let wordLogoFrame: CGRect = CGRect(x: 80, y: 150, width: self.frame.width - 80, height: 48)
      // Initialize the word logo
      let labelConfig: HomeBigLabel = HomeBigLabel()
      // Label creation
      let wordLogo: UILabel = UILabel(frame: wordLogoFrame, properties: labelConfig)
      // Set the text for the label
      wordLogo.text = "Menu"
      // Set the text alignment for the wordLogo
      wordLogo.textAlignment = .Left
      // Add the word logo to the view
      self.addSubview(wordLogo)
      // Add the bottom line
      // Initialize the line
      let line: Line = Line(frame: CGRect(x: 0, y: 208, width: self.frame.width, height: 1), alpha: 0.54)
      // Add the line to the view
      self.addSubview(line)
      
      
   }
   
   /**
      This function is used to add all the buttons
      - parameter Icons: An array of the icons for the buttons
      - parameter Labels: An array of the text of the labels for the button
   */
   private func addButtons(icons icons: [UIImage], labels: [String]) {
      // Make sure there is an equal about of labels and icons
      guard icons.count == labels.count else {
         fatalError("The icons and labels count don't match")
      }
      // Iterate over both the icons and the labels and create the buttons
      for a in 0..<icons.count {
         // Create the frame for the button
         let buttonFrame: CGRect = CGRect(x: 0, y: 209 + (48 * a), width: Int(self.frame.width), height: 48)
         // Create the button
         let button: NavigationButton = NavigationButton(frame: buttonFrame, image: icons[a], label: labels[a])
         // Set the action for the button
         button.action = { self.containingController.segue(self.desination[a]) }
         // Add the button to the view
         self.addSubview(button)
         
      }
      
   }
   
   /**
      This function is used to add the settings button to the navigation bar
   */
   private func addSettings() {
      // Set the buttons frame
      let buttonFrame: CGRect = CGRect(x: 0, y: self.frame.height - 72, width: self.frame.width, height: 48)
      // Create the button
      let button: NavigationButton = NavigationButton(frame: buttonFrame, image: Images.Action().settings, label: "Settings")
      // Set the action for the button
      button.action = { self.containingController.segue(.Settings) }
      // Add the button to the view
      self.addSubview(button)
      
   }
   
   /**
      This function is used to elevate the view and move it to the new position
      - parameter X:   Should be the new value that the view is being moved to
   */
   func show(x x: CGFloat) {
      if x > 240 {
         // Move the bar to the new location
         self.frame.origin.x = 240
      } else {
         // Move the bar to new location
         self.frame.origin.x = x
      }
      // Elevate the bar
      self.elevate(8.0)
      
      
   }

   /**
      This function is used to move the view back to being hidden and lower the view
      - parameter X:   The new value for the x position of the view
   */
   func hide(x x: CGFloat) {
      // Move the bar to new location
      self.frame.origin.x = x
      // Lower the bar
      self.elevate(0.0)
      
   }
}





