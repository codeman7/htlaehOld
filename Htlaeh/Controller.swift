//
//  Controller.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/12/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Screen size determines type of iPhone.
*/

/// iPhone 5, iPhone 6, iPhone 6+ etc.

enum ScreenSize {
   
   case small
   case medium
   case large
   
}

class Controller: UIViewController {
   /// Variable to get the size
   var size: ScreenSize {
      switch self.view.frame.size {
      case CGSize(width: 320, height: 568):
         return .small
      case CGSize(width: 375, height: 667):
         return .medium
      default:
         return .large
      }
   }
   
   var preloaded: Bool = false
   
   /// Variable to get the screen's width
   var width: CGFloat {
      return self.view.frame.width
   }
   
   /// Variable to get the screen's height
   var height: CGFloat {
      return self.view.frame.height
   }
   
   lazy var menu: Menu = self.createMenu()
   
   /*func segue(destination: Controller) {
      fatalError("Must be implemented in subclass")
   }*/
   
   // MARK: Segues
   /**
    This function calls all the segues from a navigation button press
    - parameter destination: Is the destination that we want to segue to
    */
   func segue(destination: Controller) {
      // Make sure segue is to a new controller
      guard self.newControllerSegue(destination) == true else { return }
      
      // Hide all the subviews except the header
      let views: [UIView] = self.view.subviews
      for view in views {
         if !(view is BoldHeader) {
            if !(view is Menu) {
               view.hideWithAlpha()
            }
         }
      }
      let d: Delay = Delay()
      d.delay(0.3, closure: {
         
         self.presentViewController(destination, animated: false, completion: nil)
         
      })
      
   }
   
   /**
    This function makes sure a new controller is the one we are seguing to
    
    If it is the same controller then just hide the menu
    - parameter destination: The controller that will be segued to
    
   */
   private func newControllerSegue(destination: Controller) -> Bool {
      
      let mirror = Mirror(reflecting: self)
      let destMirror = Mirror(reflecting: destination)
      guard mirror.subjectType != destMirror.subjectType else {
         self.hideMenu()
         return false
      }
      
      return true
      
   }
}

extension Controller {
   
   /// This method creates the menu
   private func createMenu() -> Menu {
      
      // Create the frame for the menu
      let frame: Rect = Rect(x: -240, y: 0, w: self.width + 240, h: self.height)
      // Create the menu and return it
      return Menu(frame: frame, containingController: self)
      
   }
   
   /// This method shows the menu and adds it to the vc
   func showMenu() {
      
      // Hide the keyboard
      self.view.endEditing(true)
      self.resignFirstResponder()
      
      // Add the menu to the controller
      self.view.addSubview(menu)
      // Show the menu
      self.menu.showView()
      
   }
   
   /// This method hides the menu
   func hideMenu() {
      print("Hide the menu")
      // Hide the menu from the view
      self.menu.hideView()
   }
   
}



protocol ViewSetup {
   func setupViews()
}


