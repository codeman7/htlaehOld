//
//  Menu.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit
/// Class for side bar navigation
class Menu: UIView {
   // MARK: Properties
   /// Property for the background grey that sits behind the menu
   private lazy var backgroundGrey: BackgroundGrey = self.createBackgroundGrey()
   /// Property for the navigation bar
   private lazy var navigationBar: NavigationBar = self.createNavigationBar()
   /// The property for the ViewController holds this menu
   let containingController: Controller
   
   // MARK: Initializers
   /**
     Default Initalizer
     - parameter Frame:   The size of the entier menu
     - parameter ContianingController: The ViewController that will contain this menu
   */
   init(frame: CGRect, containingController: Controller) {
      // Set the conainting controller
      self.containingController = containingController
      // Call the super initializer
      super.init(frame: frame)
      // Add the subviews
      self.addSubviews()
      
   }
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   // MARK: Functions
   //// Function to add all the subviews to the view
   private func addSubviews() {
      
      self.addSubview(self.backgroundGrey)
      self.addSubview(self.navigationBar)
      
   }
   
   /// This function is used to create the background grey property
   private func createBackgroundGrey() -> BackgroundGrey {
      // Set the view's frame to be the same size of the menu
      let frame: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
      // Create the view
      let view: BackgroundGrey = BackgroundGrey(frame: frame)
      // Return the view
      return view
      
   }
   
   /// This function is used to create the navigation bar
   private func createNavigationBar() -> NavigationBar {
      // Create the frame for the navigation bar
      let navigationFrame: CGRect = CGRect(x: 0, y: 0, width: 240, height: self.frame.height)
      // Create the navigation bar
      let navigationBar: NavigationBar = NavigationBar(frame: navigationFrame, containingController: containingController)
      // Return the navigation bar
      return navigationBar
      
   }
   
   
}

/// Make sure the menu conforms the overlay protocol
extension Menu: Overlay {
   
   /**
      Function to show the view after being hidden
      - note: Make sure view is added to heirachy before calling function
   */
   func showView() {
      // Create the animation to be later called
      let animation: () -> () = {
         // Show the grey
         self.backgroundGrey.alpha = self.opacity
         // Move the navigation bar into the view
         self.navigationBar.show(240)
      }
      // Animate the view
      UIView.animateWithDuration( 0.3, delay: 0.0, options: UIViewAnimationOptions(), animations: animation, completion: nil)
      
      
   }
   
   func showViewInstant() {
      self.backgroundGrey.alpha = self.opacity
      self.navigationBar.show(240)
   }
   
   /**
      Function to hide the view from the User
      - note:   This function removes the view from superview before exiting
   */
   func hideView() {
      // Create the animation to be called later
      let animation: () -> () = {
         // Hide the grey
         self.backgroundGrey.alpha = 0.0
         // Hide the navigation bar
         self.navigationBar.hide(0)
      }
      // Animate the view and on completion remove from superview
      UIView.animateWithDuration( 0.3, delay: 0.0, options: UIViewAnimationOptions(), animations: animation, completion: { Bool in
         self.removeFromSuperview()
      })
      
   }
   
}









