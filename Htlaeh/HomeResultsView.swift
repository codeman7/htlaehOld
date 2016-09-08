//
//  HomeResultsView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/6/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

private enum Labels {
   
   case encouragement
   case message
   case summary
   case nameTitle
   case name
   case weightTotalTitle
   case weightTotal
   case weightAverageTitle
   case weightAverage
   
}

struct HomeResultsView {
   
   // MARK: Properties
   fileprivate let controller: Home
   fileprivate let condensed: Bool
   fileprivate let titleFont: UIFont
   fileprivate var frames: [Labels : Rect] {
      return self.calculateFrames()
   }
   
   // MARK: Initializers
   init(_ controller: Home) {
      self.controller = controller
      self.condensed = (self.controller.width > 320) ? false : true
      self.titleFont = (self.condensed) ? .regular14 : .regular16
   }
   
   /// Adds all the content
   func addViews() {
      // Add the top messages
      self.topEncouragement()
      self.topMessage()
      // Add the summary
      self.summary()
      self.nameSection()
      self.setsSection()
      self.weightSection()
      self.repsSecion()
      self.weightAverageSection()
      self.repsAverageSection()
      
      // Add the bottom button
      self.moreButton()
   }
   
   // MARK: Functions
   fileprivate func calculateFrames() -> [Labels : Rect] {
      
      var dict: [Labels : Rect] = [:]
      
      if self.condensed {
         let x: CGFloat = 16
         let width: CGFloat = self.controller.width / 2 - 16
         dict[.encouragement] = Rect(x: x, y: 98, w: self.controller.width - 32, h: 28)
         dict[.message] = Rect(x: 12, y: 136, w: self.controller.width - 24, h: 21)
         dict[.summary] = Rect(x: x, y: 173, w: self.controller.width - 32, h: 28)
         dict[.nameTitle] = Rect(x: x, y: 213, w: width, h: 16)
         dict[.name] = Rect(x: x, y: 244, w: width, h: 42)
         dict[.weightTotalTitle] = Rect(x: x, y: 301, w: width, h: 16)
         dict[.weightTotal] = Rect(x: x, y: 332, w: width, h: 42)
         dict[.weightAverageTitle] = Rect(x: x, y: 389, w: width, h: 16)
         dict[.weightAverage] = Rect(x: x, y: 420, w: width, h: 42)
      } else {
         let x: CGFloat = 24.0
         let width: CGFloat = self.controller.width / 2 - 24
         let titleHeight: CGFloat = 19.0
         let labelHeight: CGFloat = 42.0
         dict[.encouragement] = Rect(x: 16, y: 122, w: self.controller.width - 32, h: 28)
         dict[.message] = Rect(x: 12, y: 170, width: self.controller.width - 24, height: 21)
         dict[.summary] = Rect(x: 16, y: 213, w: self.controller.width - 32, h: 28)
         dict[.nameTitle] = Rect(x: x, y: 261, w: width, h: titleHeight)
         dict[.name] = Rect(x: x, y: 295, w: width, h: labelHeight)
         dict[.weightTotalTitle] = Rect(x: x, y: 352, w: width, h: titleHeight)
         dict[.weightTotal] = Rect(x: x, y: 386, w: width, h: labelHeight)
         dict[.weightAverageTitle] = Rect(x: x, y: 443, w: width, h: titleHeight)
         dict[.weightAverage] = Rect(x: x, y: 477, w: width, h: labelHeight)
      }
      
      return dict
      
   }
   
   /// Create the top encouragement
   fileprivate func topEncouragement() {
      
      // Get the message for the label
      let messages: [String] = ["Good job!", "Congrats!", "Congratulations!", "Great work!", "Wow!"]
      let messageInt: Int = Int(arc4random() % 4)
      let message: String = messages[messageInt]
      
      // Create the frame for the title and the title
      let frame: Rect = self.frames[.encouragement] ?? CGRect.zero
      let title: UILabel = UILabel(frame: frame, properties: HomeLabel.sectionHeader)
      
      // Set the text property and the color of the label
      title.text = message
      title.textColor = .blue
      
      // Add the label as a subview
      self.controller.view.addSubview(title)
      
   }
   
   /// Create the top message
   fileprivate func topMessage() {
      
      // Set the message and frame for the view
      let message: String = "You met your goal of 5 days this week!"
      let frame: Rect = Rect(x: 12, y: 162, w: self.controller.width - 24, h: 24)
      
      // Create the label and get the required width
      let label: UILabel = UILabel(frame: self.frames[.message] ?? Rect.zero)
      let width: CGFloat = message.widthWithConstrainedHeight(24, font: .medium18)
      
      // Set the font and text for the label
      label.font = (width > frame.width) ? .medium16 : .medium18
      label.text = message
      
      // Set the alpha and the text alignment
      label.alpha = 0.74
      label.textAlignment = .center
      
      // Add the view to the controller
      self.controller.view.addSubview(label)
      
   }
   
   
   /// Create summary title
   fileprivate func summary() {
      
      // The frame for the label and the label
      let frame: Rect = self.frames[.summary] ?? Rect.zero
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.sectionHeader)
      
      // Set the text and text color properties
      label.text = "Summary"
      label.textColor = .red
      
      // Set the alignment and add the label as a subview
      label.textAlignment = .center
      self.controller.view.addSubview(label)
      
   }
   
   
   /// Create name section
   fileprivate func nameSection() {
      
      // Craete the frame for the title and the title
      let title: UILabel = UILabel(frame: self.frames[.nameTitle] ?? Rect.zero)
      
      // Set the font and alpha for the title
      title.font = self.titleFont
      title.alpha = 0.54
      
      // Set the alignment and text for the title
      title.textAlignment = .left
      title.text = "Most popular exercise"
      
      // Add the title to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the name and the name
      let label: UILabel = UILabel(frame: self.frames[.name] ?? Rect.zero)
      
      // Set the alpha and the text alignment for the labael
      label.alpha = 0.87
      label.textAlignment = .left
      
      // Set the font for the label and the text
      print(self.controller.workout!)
      label.text = self.controller.workout!.mostCommonExercise()
      label.setFont()
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   
   /// Create total sets section
   fileprivate func setsSection() {
      
      // Craete the frame for the title and the title
      var titleFrame: Rect = self.frames[.nameTitle] ?? Rect.zero
      titleFrame = Rect(x: self.controller.width / 2, y: titleFrame.origin.y, w: titleFrame.w, h: titleFrame.h)
      let title: UILabel = UILabel(frame: titleFrame)
      
      // Set the font, text alignment, alpha, and the text for the title
      self.title(title)
      title.text = "Total Sets"
      
      // Add the title to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the name and the name
      var labelFrame: Rect = self.frames[.name] ?? Rect.zero
      labelFrame = Rect(x: self.controller.width / 2, y: labelFrame.origin.y, w: labelFrame.w, h: labelFrame.h)
      let label: UILabel = UILabel(frame: labelFrame)
      
      // Set the alpha, font, alignment, and the text alignment for the labael
      self.content(label)
      label.text = "\(self.controller.workout!.count)"
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   /// Create total weight section
   fileprivate func weightSection() {
      
      // Craete the frame for the title and the title
      let title: UILabel = UILabel(frame: self.frames[.weightTotalTitle] ?? Rect.zero)
      
      // Set the text alignment, the font, the alpha, and the text
      self.title(title)
      title.text = "Total Weight"
      
      // Add the title to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the name and the name
      let label: UILabel = UILabel(frame: self.frames[.weightTotal] ?? Rect.zero)
      
      // Set the alpha, font, alignment, and the text alignment for the labael
      self.content(label)
      label.text = "\(Int(self.controller.workout!.totalWeight))"
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   /// Create total reps section
   fileprivate func repsSecion() {
      
      // Create the frame for the label and the label
      let frame: Rect = Rect(x: self.controller.width / 2, y: self.frames[.weightTotalTitle]!.origin.y, w: self.frames[.weightTotalTitle]!.w, h: self.frames[.weightTotal]!.h)
      let title: UILabel = UILabel(frame: frame)
      
      // Set the font, alignment, alpha, and text
      self.title(title)
      title.text = "Total Reps"
      
      // Add the label to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the label and the label
      let labelFrame: Rect = Rect(x: self.controller.width / 2, y: self.frames[.weightTotal]!.origin.y, w: self.frames[.weightTotal]!.w, h: self.frames[.weightTotal]!.h)
      let label: UILabel = UILabel(frame: labelFrame)
      
      // Set the font, alignment, alpha, and text
      self.content(label)
      label.text = "\(self.controller.workout!.totalReps)"
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   /// Create average weight section
   fileprivate func weightAverageSection() {
      
      // Craete the frame for the title and the title
      let title: UILabel = UILabel(frame: self.frames[.weightAverageTitle] ?? Rect.zero)
      
      // Set the text alignment, the font, the alpha, and the text
      self.title(title)
      title.text = "Average Weight"
      
      // Add the title to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the name and the name
      let label: UILabel = UILabel(frame: self.frames[.weightAverage] ?? Rect.zero)
      
      // Set the alpha, font, alignment, and the text alignment for the labael
      self.content(label)
      let weightAverage: NumberRepresentable = self.controller.workout!.averageWeight.to(decimalPlace: 1).wholeNumber() ?? self.controller.workout!.averageWeight.to(decimalPlace: 1)
      label.text = "\(weightAverage)"
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   /// Create average reps section
   fileprivate func repsAverageSection() {
      
      // Create the frame for the label and the label
      let frame: Rect = Rect(x: self.controller.width / 2, y: self.frames[.weightAverageTitle]!.origin.y, w: self.frames[.weightAverageTitle]!.w, h: self.frames[.weightTotal]!.h)
      let title: UILabel = UILabel(frame: frame)
      
      // Set the font, alignment, alpha, and text
      self.title(title)
      title.text = "Total Reps"
      
      // Add the label to the controller
      self.controller.view.addSubview(title)
      
      // Create the frame for the label and the label
      let labelFrame: Rect = Rect(x: self.controller.width / 2, y: self.frames[.weightAverage]!.origin.y, w: self.frames[.weightAverage]!.w, h: self.frames[.weightTotal]!.h)
      let label: UILabel = UILabel(frame: labelFrame)
      
      // Set the font, alignment, alpha, and text
      self.content(label)
      let averageReps: NumberRepresentable = self.controller.workout!.averageReps.to(decimalPlace: 1).wholeNumber() ?? self.controller.workout!.averageReps.to(decimalPlace: 1)
      label.text = "\(averageReps)"
      
      // Add the label to the controller
      self.controller.view.addSubview(label)
      
   }
   
   /// Create add more button
   fileprivate func moreButton() {
      
      let y: CGFloat = (self.condensed) ? self.controller.height - 60 : self.controller.height - 72
      let frame: Rect = Rect(x: self.controller.width / 2 - 62, y: y, w: 124, h: 40)
      
      let button: Button = Button(frame: frame, type: .raised)
      button.backgroundColor = .yellow
      
      button.set(title: "ADD MORE", color: .black)
      button.action = { self.controller.addMore() }
      
      self.controller.view.addSubview(button)
      
   }
   
   fileprivate func title(_ label: UILabel) {
      
      label.font = self.titleFont
      label.alpha = 0.54
      label.textAlignment = .right
      
   }
   
   fileprivate func content(_ label: UILabel) {
      
      label.font = .bold36
      label.alpha = 0.87
      label.textAlignment = .right
      
   }
   
}

extension HomeResultsView {
   
   var padding: CGFloat {
      return (self.condensed) ? 16.0 : 24.0
   }
   
}






