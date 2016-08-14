//
//  HomeHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol Head {
   var title: String { get }
   var leftIcon: UIImage { get }
   var rightIcon: UIImage? { get }
   var rightButtonAction: (()->())? { get }
   var leftButtonAction: (()->())? { get }
}
