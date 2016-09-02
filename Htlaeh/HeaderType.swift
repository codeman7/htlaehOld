//
//  HeaderType.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct HeaderType : Head {
   
   let title: String
   let leftIcon: UIImage
   let rightIcon: UIImage?
   let rightButtonAction: (() -> ())?
   let leftButtonAction: (() -> ())?
   
   private init(title: String, leftIcon: UIImage, rightIcon: UIImage?, leftButtonAction: (()->())?, rightButtonAction: (()->())?) {
      self.title = title
      self.leftIcon = leftIcon
      self.rightIcon = rightIcon
      self.leftButtonAction = leftButtonAction
      self.rightButtonAction = rightButtonAction
   }
   
   static func home(controller controller: Home) -> HeaderType {
      return HeaderType(title: "Home", leftIcon: Images.Navigation().menu, rightIcon: Images.Navigation().more, leftButtonAction: { controller.showMenu() }, rightButtonAction: { controller.showMore() })
   }
   
   static func search(controller controller: Search) -> HeaderType {
      return HeaderType(title: "Search", leftIcon: Images.Navigation().menu, rightIcon: nil, leftButtonAction: { controller.showMenu() }, rightButtonAction: nil)
   }
   
   static func all(controller controller: All) -> HeaderType {
      return HeaderType(title: "All", leftIcon: Images.Navigation().menu, rightIcon: Images.Action().today, leftButtonAction: { controller.showMenu() }, rightButtonAction: { controller.showCal() })
   }
   
   static func preview(controller controller: PreviewWorkout) -> HeaderType {
      return HeaderType(title: "Preview", leftIcon: Images.Navigation().back, rightIcon: nil, leftButtonAction: { controller.backToNewWorkout() }, rightButtonAction: nil)
   }
   
   static func new(controller controller: NewWorkout) -> HeaderType {
      return HeaderType(title: "New", leftIcon: Images.Navigation().menu, rightIcon: Images.Action().reorder, leftButtonAction: { controller.showMenu() }, rightButtonAction: { controller.showPreview() })
   }
   
   static func settings(controller controller: Settings) -> HeaderType {
      return HeaderType(title: "Settings", leftIcon: Images.Navigation().menu, rightIcon: nil, leftButtonAction: { controller.showMenu() }, rightButtonAction: nil)
   }
   
   
}