//
//  WorkoutCell.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/19/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class WorkoutCell : UITableViewCell {
   
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      // Call the super initializer
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      // Make the view go all the way across
      self.separatorInset = UIEdgeInsetsZero
      self.layoutMargins = UIEdgeInsetsZero
      self.preservesSuperviewLayoutMargins = false
      self.frame.size.height = 48.0
   
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NScoding")
   }
   
   func addTitlesFor(set: WeightSet) {
      
      let cellFrames: CellLayout = CellLayout(frame: self.frame)
      // Add the exercise title
      self.addTitleWith(cellFrames.left(), title: "\(set.name)", config: WorkoutContentStringLabel())
      // Add the weight title
      self.addTitleWith(cellFrames.right(), title: "\(Int(set.weight!))", config: WorkoutContentNumberLabel())
      // Add the reps title
      self.addTitleWith(cellFrames.middle(), title: "\(set.reps!)", config: WorkoutContentNumberLabel())
      
   }
   
   private func addTitleWith<A: TextPresentable>(frame: Rect, title: String, config: A) {
      
      // Create the label and set its title
      let label: UILabel = UILabel(frame: frame, properties: config)
      label.text = title
      // Add the label to the view
      self.addSubview(label)
      
   }
   
}






