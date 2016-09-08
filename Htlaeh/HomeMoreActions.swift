//
//  HomeMoreActions.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/6/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HomeMoreActions {
   
   // MARK: Properties
   let controller: Home
   
   // MARK: Initializers
   /**
    Default initializer
    - parameter controller: The controller that will hold the actions and any subviews added
   */
   init(_ controller: Home) {
      // Set the controller property
      self.controller = controller
   }
   
   // MARK: Functions
   /// The action for when "Mark as done" is pressed
   func markAsDone() {
      
      // Add the white background
      self.addWhite()
      
      // Modify the workout accordingly
      
   }
   
   fileprivate func addContentToWhite(_ view: UIView) {
      
      // Add the loading animation
      let loading = self.createLoading()
      self.controller.view.addSubview(loading)
      loading.backgroundColor = nil
      loading.animation()
      
      // Add the toast
      let toast = self.createToast()
      self.controller.view.addSubview(toast)
      toast.show(2.5)
      
      let delay: Delay = Delay()
      delay.delay(2.5, closure: {
         view.removeFromSuperview()
         self.enclosingCircle()
         loading.removeFromSuperview()
         self.removeViews()
      })
      
   }
   
   /// The action for when "Change date" is pressed
   func changeDate() {
      
      // Show the dialog
      
   }
   
   fileprivate func removeViews() {
      
      let delay: Delay = Delay()
      let header = self.controller.view.subviews.filter({ $0 is BoldHeader }).first
      let views = self.controller.view.subviews.filter({ $0 != header })
      delay.delay(5.0, closure: {
         for view in views {
            view.removeFromSuperview()
         }
         
         let results: HomeResultsView = HomeResultsView(self.controller)
         results.addViews()
      })
      
   }
   
   fileprivate func addWhite() {
      
      // Create the frame for the view and the view itself
      let frame: Rect = self.controller.view.frame
      let view: UIView = UIView(frame: frame)
      
      // Set the background color and the alpha for the view
      view.backgroundColor = .white
      view.alpha = 0.0
      
      // Add the view to the controller and animate it to be visable
      self.controller.view.addSubview(view)
      UIView.animate(withDuration: 0.15, animations: {
         view.alpha = 0.74
         }, completion: { Bool in
            self.addContentToWhite(view)
      })
      
   }
   
   fileprivate func enclosingCircle() {
      
      let view: UIView = UIView(frame: Rect(x: 0, y: 92, w: self.controller.width, h: self.controller.height - 92))
      view.layer.masksToBounds = true
      self.controller.view.addSubview(view)
      let enclosingCircle: EnclosingCircle = EnclosingCircle(radius: 500, view: view)
      enclosingCircle.animate()
      
   }
   
   fileprivate func createLoading() -> Loading {
      
      // Create the frame for the loading animation and the loading animation
      let frame: Rect = Rect(x: self.controller.width / 2 - 60, y: self.controller.height / 2 - 40, w: 120, h: 80)
      let animation: Loading = Loading(frame: frame)
      
      // Return the animation
      return animation
      
   }
   
   fileprivate func createToast() -> Toast {
      
      // Create the styles for the button and craete the toast
      let buttonInit: (String, UIColor, ()->()) = ("CANCEL", .yellow, { print("Cancel the mark") })
      let toast: Toast = Toast(frame: Rect(x: 0, y: self.controller.height, width: self.controller.width, height: 48), text: "Marking workout as complete", button: buttonInit)
      
      // Return the toast
      return toast
      
   }
   
}






