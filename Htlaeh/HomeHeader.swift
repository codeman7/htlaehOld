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

struct HomeHeader: Head {
   let title: String = "Home"
   let leftIcon: UIImage = Images.Navigation().menu
   let rightIcon: UIImage? = Images.Navigation().more
   let rightButtonAction: (() -> ())?
   let leftButtonAction: (() -> ())?
   init(controller: Home) {
      self.rightButtonAction = { controller.showMore() }
      self.leftButtonAction = { controller.showMenu() }
   }
}

/*extension HomeHeader : Head {
   var title: String { return "Home" }
   var leftIcon: UIImage { return Images.Navigation().menu }
}*/