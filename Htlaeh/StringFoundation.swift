//
//  StringFoundation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/25/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

extension String {
   
   subscript (i: Int) -> Character {
      return self[self.characters.index(self.startIndex, offsetBy: i)]
   }
   
   subscript (i: Int) -> String {
      return String(self[i] as Character)
   }
   
   subscript (r: Range<Int>) -> String {
      let start = characters.index(startIndex, offsetBy: r.lowerBound)
      let end = <#T##String.CharacterView corresponding to `start`##String.CharacterView#>.index(start, offsetBy: r.upperBound - r.lowerBound)
      return self[Range(start ..< end)]
   }
   
   func trimmed() -> String {
      if self.characters.last == " " {
         return self[0...characters.count - 2]
      }
      return self
   }
   
   mutating func trim() {
      if self.characters.last == " " {
         self = self[0...characters.count - 2]
      }
   }
}
