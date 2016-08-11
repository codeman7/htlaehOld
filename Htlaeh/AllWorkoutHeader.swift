//
//  AllWorkoutHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct AllWorkoutHeader : Head {
   let title: String
   let leftIcon: UIImage = Images.Navigation().menu
   let rightIcon: UIImage? = Images.Action().today
   let rightButtonAction: (() -> ())?
   let leftButtonAction: (() -> ())?
   init(controller: All) {
      self.rightButtonAction = { controller.showCal() }
      self.leftButtonAction = { controller.showMenu() }
      switch controller.type! {
      case .All:
         self.title = "All"
      case .Preview:
         self.title = "Preview"
      case .WorkoutStatus:
         self.title = "Status"
      }
   }
}