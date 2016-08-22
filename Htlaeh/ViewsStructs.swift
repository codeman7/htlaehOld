//
//  ViewsStructs.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/17/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This protocol is for all structs that will lay out the views
 */
protocol ViewsStruct {
   /// Default and only initailzer for views
   init<T: Controller>(controller: T)
   /// The property for all the views
   var views: [UIView: (delay: Double, alpha: CGFloat)] { get set }
   /// Call this function to show all the views in the controller
   func show()
   /// The function to layout all the views
   mutating func layoutViews()
}

extension ViewsStruct {
   
   func show() {
      
      for (view, properties) in self.views {
         view.showWithAlpha(properties.delay, alpha: properties.alpha)
      }
      
   }
   
}

