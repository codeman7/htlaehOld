//
//  NavigationDestinations.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit
/**
   This struct is used to get any and all VC's
 */
struct NavigationDestinations {
   
   static var home: Controller {
      return Home()
   }
   
   static var newWorkout: Controller {
      return NewWorkout()
   }
   
   static var allWorkouts: Controller {
      return All()
   }
   
   static var preview: Controller {
      return PreviewWorkout()
   }
   
   static var settings: Controller {
      return Settings()
   }
   
   static var search: Controller {
      return Search()
   }
}