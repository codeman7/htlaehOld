//
//  StatsView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/18/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class StatsView : UIView {
   // MARK: Properties
   /// The variable that will hold the data that the views have
   private let data: StatsViewData
   /// The array for the top views
   var topViews: [UILabel] = []
   /// The array for the bottom views
   var bottomViews: [UILabel] = []
   /// The variable for the content labels
   var content: [UILabel] = []
   
   
   // MARK: Initializers
   /**
     Default and only initializer
     - parameter frame: The frame that the view will have
     - parameter data: The data that will be displayed in the content views
   */
   init(frame: CGRect, data: StatsViewData) {
      
      self.data = data
      // Call the super initializer
      super.init(frame: frame)
      // Add all the hint labels
      self.addHints()
      // Add all the content labels
      self.addContent()
      
      
   }
   
   /// Requied by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   func show() {
      
      for view in self.topViews {
         if content.contains(view) {
            view.showWithAlpha(0.025, alpha: 0.87)
         } else {
            view.showWithAlpha(0.025, alpha: 0.38)
         }
      }
      
      for view in self.bottomViews {
         if content.contains(view) {
            view.showWithAlpha(0.05, alpha: 0.87)
         } else {
            view.showWithAlpha(0.05, alpha: 0.38)
         }
      }
      
   }
   
   // MARK: Functions
   /**
    This function lays out all the hints
   */
   private func addHints() {
      // Create the configurations for the labels
      let leftLabel: Label = Label(color: .black, alpha: 0.38, align: .Left, font: Fonts.Regular.sixteen)
      let rightLabel: Label = Label(color: .black, alpha: 0.38, align: .Right, font: Fonts.Regular.sixteen)
      // Create the grid for all the views
      let grid: Grid = Grid(size: self.frame.size, xPadding: 16, yPadding: 16)
      // Create the personal best hint and add it to the top array
      let personalBest: UILabel = self.add(label: leftLabel, text: "Personal Best", frame: grid.topLeft())
      self.topViews += [personalBest]
      // Create the total sets hint and add it to the top array
      let sets: UILabel = self.add(label: rightLabel, text: "Total Sets", frame: grid.topRight())
      self.topViews += [sets]
      // Create the total weight hint and add it to the bottom array
      let weight: UILabel = self.add(label: leftLabel, text: "Total Weight", frame: grid.bottomLeft())
      self.bottomViews += [weight]
      // Create the total reps hint and add it to the bottom array
      let reps: UILabel = self.add(label: rightLabel, text: "Total Reps", frame: grid.bottomRight())
      self.bottomViews += [reps]
   }
   
   /**
    This function lays out all the content labels
   */
   private func addContent() {
      // Create the configurations for the labels
      let leftLabel: Label = Label(color: .black, alpha: 0.87, align: .Left, font: Fonts.Regular.twentyFour)
      let rightLabel: Label = Label(color: .black, alpha: 0.87, align: .Right, font: Fonts.Regular.twentyFour)
      // Create the grid to layout the labels and add it to the top array
      let grid: Grid = Grid(size: self.frame.size, xPadding: 16, yPadding: 45)
      // Create the personal best label and add it to the top array
      let best: UILabel = self.add(label: leftLabel, text: "\(self.data.personalBest) lbs", frame: grid.topLeft())
      self.topViews += [best]
      // Create the total sets label and add it to the top array
      let sets: UILabel = self.add(label: rightLabel, text: "\(self.data.totalSets)", frame: grid.topRight())
      self.topViews += [sets]
      // Get the value for the label
      let weightLabel: Double = Double(round(100*(Double(self.data.totalWeight) / 2000))/100)
      // Create the total weight label and add it to the bottom array
      let weight: UILabel = self.add(label: leftLabel, text: "\(weightLabel) tons", frame: grid.bottomLeft())
      self.bottomViews += [weight]
      // Create the total reps label and add it to the bottom array
      let reps: UILabel = self.add(label: rightLabel, text: "\(self.data.totalReps)", frame: grid.bottomRight())
      self.bottomViews += [reps]
      // Add all the labels to the content array
      self.content = [best, sets, weight, reps]
      
      
   }
   
   private func add(label label: Label, text: String, frame: Rect) -> UILabel {
      
      // Create the label
      let label: UILabel = UILabel(frame: frame, properties: label)
      
      // Get the height for the label and set it to the labels height
      let height: CGFloat = text.heightWithConstrainedWidth(frame.width, font: label.font)
      label.frame.size.height = height
      
      // Set the labels alpha
      label.alpha = 0.0
      
      // Set the text for the label and add it as a subview
      label.text = text
      self.addSubview(label)
      
      // Return the label
      return label
      
      
   }
   
}






