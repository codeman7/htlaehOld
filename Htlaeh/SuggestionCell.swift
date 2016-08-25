//
//  SuggestionCell.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/24/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class SuggestionCell : UITableViewCell {
   
   // MARK: Properties
   var title: UILabel? = nil
   
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      // Call the super initializer
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      // Make the cell go all the way across
      self.separatorInset = UIEdgeInsetsZero
      self.layoutMargins = UIEdgeInsetsZero
      self.preservesSuperviewLayoutMargins = false
      self.frame.size.height = 56.0
      
      // Set the selection style
      self.selectionStyle = .None
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   func add(title: String) {
      
      guard self.title == nil else {
         self.title?.text = title
         return
      }
      
      // Create the frame for the label and the label itself
      let frame: Rect = Rect(x: 16, y: 4, w: self.frame.w - 32, h: 48)
      self.title = UILabel(frame: frame, font: Fonts.Bold.thirtySix, align: .Left
         , color: .black)
      
      // Set the labels text and it's alpha
      self.title!.text = title
      self.title!.alpha = 0.54
      
      // Add the label as a subview
      self.addSubview(self.title!)
      
   }
   
}