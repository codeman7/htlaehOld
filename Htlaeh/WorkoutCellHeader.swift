//
//  WorkoutCellHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/22/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class WorkoutCellHeader : UITableViewCell {
   // MARK: Properties
   
   // MARK: Intializers
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      // Call the super initializer
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      // Make the cell go all the way accross
      self.separatorInset = UIEdgeInsets.zero
      self.layoutMargins = UIEdgeInsets.zero
      self.preservesSuperviewLayoutMargins = false
      self.frame.size.height = 49.0
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   func add(date: String) {
      // Create the label and set it's font
      let label: UILabel = UILabel(frame: Rect(x: 16, y: 0, w: self.frame.w - 32, h: 21))
      label.font = Fonts.Regular.sixteen
      // Set the alpha and text for the label
      label.alpha = 0.54
      label.text = date
      
      // Make the label left aligned and add it as a subview
      label.textAlignment = .left
      self.addSubview(label)
      
   }
   
   func addHeaders() {
      
      let cellFrames: CellLayout = CellLayout(frame: self.frame)
      // Add the exercise title
      self.addTitleWith(frame: cellFrames.left(), title: "Exercise", config: WorkoutTableColumnHeadString())
      // Add the weight label
      self.addTitleWith(frame: cellFrames.right(), title: "Weight", config: WorkoutTableColumnHeadNumber())
      // add the reps label
      self.addTitleWith(frame: cellFrames.middle(), title: "Reps", config: WorkoutTableColumnHeadNumber())
      
   }
   
   fileprivate func addTitleWith<A: TextPresentable>(frame: Rect, title: String, config: A) {
      
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: config)
      // Fix the y position for the label
      label.frame.origin.y = self.frame.h - 20
      // Set the labels text
      label.text = title
      // Add the label as a subview
      self.addSubview(label)
      
   }
   
   
   
}
