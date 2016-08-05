//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This protocol is used for all tutorials
 */
protocol Tutorial {
   
   func firstStep(controllerView view: UIView) -> [ViewRepresentable]
   
}

/**
   This protocol just means that a user can see it on the screen
 */
protocol ViewRepresentable {
   
}

extension UIView : ViewRepresentable { }
extension CALayer : ViewRepresentable { }
