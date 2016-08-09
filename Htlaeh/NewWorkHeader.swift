//
//  NewWorkHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/8/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct NewWorkoutHeader : Head {
   let title: String = "New"
   let leftIcon: UIImage = Images.Navigation().menu
   let rightIcon: UIImage? = Images.Action().reorder
   let rightButtonAction: (() -> ())?
   let leftButtonAction: (() -> ())?
   init(controller: NewWorkout) {
      self.rightButtonAction = { controller.showPreview() }
      self.leftButtonAction = { controller.showMenu() }
   }
}
