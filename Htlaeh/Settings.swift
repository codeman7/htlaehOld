//
//  Settings.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class Settings : Controller {
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func logout() {
      
   }
   
   func updateTimeBool(value: Bool) {
      
      print("Please change time \(value)")
      
   }
   
   func updateNextAudio(value: Bool) {
      
      print("Please update next audio to \(value)")
      
   }
   
}

// MARK: Extension to layout all the views
extension Settings : ViewSetup {
   
   func setupViews() {
      
      // Set the background color
      self.view.backgroundColor = .white
      // Get the views from the view struct
      var views: SettingsStandardViews = SettingsStandardViews(controller: self)
      
      // Add the views to the controller and lay them out
      views.layoutViews()
      views.show()
      
   }
   
}