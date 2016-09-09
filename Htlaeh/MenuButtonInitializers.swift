//
//  MenuButtonInitializers.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

struct MenuButtonInitializer {
   let title: String
   let action: () -> ()
   init(_ title: String, action: ()->()) {
      self.title = title
      self.action = action
   }
}
