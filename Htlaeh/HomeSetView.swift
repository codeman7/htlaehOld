//
//  HomeSetView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/30/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used on the homepage to go through workouts
 */

class HomeSetView : UIView {
   
   // MARK: Properties
   /// This property is for the current set
   var currentSet: WeightSet
   /// This property is for the next set
   var nextSet: WeightSet? = nil
   
   /// The property for the top label in the top half  
   private lazy var topTopHint: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.topX, y: self.topY, w: self.fullWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = "Exercise Name"
      return label

   }()
   
   /// The property for the left label in the top half
   private lazy var topLeftHint: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.leftX, y: self.topY + 96, w: self.halfWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = "Reps"
      return label
   }()
   
   /// The property for the right label in the top half
   private lazy var topRightHint: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.rightX, y: self.topY + 96, w: self.halfWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = "Weight"
      return label
   }()
   
   /// The property for the top label in the top half
   lazy var topTopContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.topX, y: self.topY + 24, w: self.fullWidth, h: 48)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.content)
      
      // Return the label
      return label
   }()
   
   /// The property for the left label in the top half
   private lazy var topLeftContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.leftX, y: self.topY + 120, w: self.halfWidth, h: 48)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.content)
      
      // Return the label
      return label
   }()
   
   /// The property for the right label in the top half
   private lazy var topRightContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.rightX, y: self.topY + 120, w: self.halfWidth, h: 48)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.content)
      
      // Return the label
      return label
   }()
   
   /// The property for the top label in the bottom half
   private lazy var bottomTopHint: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.topX, y: self.bottomY, w: self.fullWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = "Rest"
      return label
   }()
   
   /// The property for the left label in the bottom half
   private lazy var bottomLeftHint: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.leftX, y: self.bottomY + 52, w: self.halfWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = ""
      return label
   }()
   
   /// The property for the right label in the bottom half
   private lazy var bottomRightHint: UILabel = {
      // Create the frame and label
      let frame: Rect = Rect(x: self.rightX, y: self.bottomY + 52, w: self.halfWidth, h: 16)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.hint)
      
      // Set the label's text and return the label
      label.text = ""
      return label
   }()

   
   /// The property for the top label in the bottom half
   private lazy var bottomTopContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.topX, y: self.bottomY + 16, w: self.fullWidth, h: 32)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.accent)
      
      // Return the label
      return label
   }()
   
   /// The property for the left label in the bottom half
   private lazy var bottomLeftContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.leftX, y: self.bottomY + 68, w: self.halfWidth, h: 28)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.accent)
      
      // Return the label
      return label
   }()
   
   /// The property for the right label in the bottom half
   private lazy var bottomRightContent: UILabel = {
      // Create the frame and the label
      let frame: Rect = Rect(x: self.rightX, y: self.bottomY + 68, w: self.halfWidth, h: 28)
      let label: UILabel = UILabel(frame: frame, properties: HomeLabel.accent)
      
      // Return the label
      return label
   }()
   
   
   
   /// The number of rows in the top sectoin
   var topRowCount: Int = 2
   
   /// The number of rows in the bottom section
   var bottomRowCount: Int = 1
   
   /// Used to determine if resting or active
   var resting: Bool = false
   
   
   // MARK: Initializer
   init(frame: CGRect, set: WeightSet) {
      
      // Assign the set to the current set
      self.currentSet = set
      // Call the super initializer
      super.init(frame: frame)
      // Set up the default views
      self.initialLayoutFor(set: set)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   func initialLayoutFor(set set: WeightSet) {
      
      // Add subviews
      self.insertViews()
      
      // Set all the top labels
      self.topTopContent.text = set.name
      self.topLeftContent.text = "\(set._reps)"
      self.topRightContent.text = "\(Int(set._weight))"
      
      // Set the bottom label
      self.bottomTopContent.text = set._restTime.toString()
      
   }
   
   private func insertViews() {
      
      self.addSubview(self.topTopHint)
      self.addSubview(self.topLeftHint)
      self.addSubview(self.topRightHint)
      self.addSubview(self.topTopContent)
      self.addSubview(self.topLeftContent)
      self.addSubview(self.topRightContent)
      self.addSubview(self.bottomTopHint)
      self.addSubview(self.bottomLeftHint)
      self.addSubview(self.bottomRightHint)
      self.addSubview(self.bottomTopContent)
      self.addSubview(self.bottomLeftContent)
      self.addSubview(self.bottomRightContent)

      
   }
   
   /**
    This function moves the rest to the upper state and shows what will be the next set
    - parameter set: The next set that will be shown
   */
   func rest(set set: WeightSet) {
      
      // Set the next set value to the set passed as variable
      self.nextSet = set
      
      // Update the row counts for each view
      self.topRowCount = 1
      self.bottomRowCount = 2
      
      // Animate the views
      UIView.animateWithDuration(0.2, animations: {
         
         self.showRest()
         
         }, completion: { Bool in
            // Set the view's back to what they need to be
            self.nextCompletion()
         })
      
   }
   
   
   
   /**
    This function moves the next set up and gets rid of rest property for the last set
   */
   func next() {
      
      
      self.resting = false
      // Set the current set
      self.currentSet = self.nextSet!
      self.nextSet = nil
      
      // Set the exit property and update the row counts
      self.topRowCount = 2
      self.bottomRowCount = 1
      
      UIView.animateWithDuration(0.2, animations: {
         
            self.nextToActiveAnimation()
         
         }, completion: { Bool in
            
            self.nextToActiveCompletion()

      })
      
      
      
   }
   
   func finished() {
      print("All Done!")
   }
   
   /**
      This function moves the rest up for the last set
   */
   func done() {
      
      // Set next set to nil
      self.nextSet = nil
      print("About to be all done")
      
      self.topRowCount = 1
      self.bottomRowCount = 2
      
      // Animate the views
      UIView.animateWithDuration(0.2, animations: {
         
         self.showRest()
         
         }, completion: { Bool in
            // Set the view's back to what they need to be
            self.doneCompletion()
      })
      
   }
   
   private func showRest() {
      
      self.resting = true
      // Get the exit position and all the views to animate
      let exit: CGPoint = CGPoint(x: self.frame.w / 2, y: 0)
      let topLabels: [UILabel] = [topTopHint, topTopContent, topLeftHint, topLeftContent, topRightHint, topRightContent]
      // Animate the labels up top to leave
      for labels in topLabels {
         labels.alpha = 0.0
         labels.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05)
         labels.frame.origin = exit
      }
      
      // Animate the bottom labels up
      self.bottomTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5)
      self.bottomTopContent.alpha = HomeLabel.content.alpha
      self.bottomTopContent.frame.origin.y = self.topY + 24
      
      self.bottomTopHint.frame.origin.y = self.topY
      
   }
   
   private func restTimer() {
      
      // Make sure label can be convert to time and get it's value
      guard let amount =  self.topTopContent.text!.time() else {
         return
      }
     
      
      // Call function to update the label
      let delay = Delay()
      delay.delay(1.0, closure: {
         self.updateRest(amount - 1)
      })
      
   }
   
   private func updateRest(amount: Double) {
      
      // Make sure we are still resting or exit the function
      guard self.resting == true else {
         return
      }

      // Update the label
      self.topTopContent.text = amount.toString()
      
      if amount == 10 {
         // Alert user that rest is almost up
         Audio.tenSecondsLeft()
      }
      
      if amount == 0 {
         Audio.speak("Time for your next set")
      }
      
      // If there are less than 10 seconds left then update the color of the label
      if amount <= 10 {
         
         let color: UIColor = (amount % 2 == 1) ? .black : .yellow
         self.topTopContent.textColor = color
      }
      
      // Make sure the amount isn't going to be negative if so stop recursion
      guard amount > 0 else {
         return
      }
      
      self.restTimer()
      
   }
   
}

// MARK: Animations
private extension HomeSetView {
   
   /// Completion block for current set going to rest
   private func nextCompletion() {
      
      self.topTopHint.alpha = HomeLabel.hint.alpha
      self.topTopHint.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.topTopHint.frame.origin = CGPoint(x: self.topX, y: self.topY)
      self.topTopHint.text = "Rest"
      
      self.topTopContent.alpha = HomeLabel.content.alpha
      self.topTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.topTopContent.frame.origin = CGPoint(x: self.topX, y: self.topY + 24)
      self.topTopContent.text = self.currentSet.restTime!.toString()
      
      self.bottomTopHint.text = "Exercise"
      self.bottomTopHint.frame.origin.y = self.bottomY
      
      self.bottomTopContent.frame.origin.y = self.bottomY + 16
      self.bottomTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.bottomTopContent.alpha = HomeLabel.accent.alpha
      self.bottomTopContent.text = self.nextSet!.name
      
      self.bottomLeftHint.text = "Reps"
      self.bottomLeftHint.frame.origin.y = self.bottomY + 52
      
      self.bottomLeftContent.text = "\(self.nextSet!._reps)"
      self.bottomLeftContent.frame.origin.y = self.bottomY + 68
      
      
      self.bottomRightHint.text = "Weight"
      self.bottomRightHint.frame.origin.y = self.bottomY + 52
      
      self.bottomRightContent.text = "\(Int(self.nextSet!._weight))"
      self.bottomRightContent.frame.origin.y = self.bottomY + 68
      
      self.restTimer()
      
      
   }
   
   private func nextToActiveAnimation() {
      
      // Set the exit location
      let exit: CGPoint = CGPoint(x: self.frame.w / 2, y: 0)
      
      // Animate the top label's up and out of view
      for label in [self.topTopHint, self.topTopContent] {
         label.alpha = 0.0
         label.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.05, 0.05)
         label.frame.origin = exit

      }
      
      // Animate the next labels up to active
      self.bottomTopHint.frame.origin.y = self.topY
      
      self.bottomTopContent.frame.origin.y = self.topY + 30
      self.bottomTopContent.alpha = HomeLabel.content.alpha
      self.bottomTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5)
      
      // Animate the bottom left and right content up
      for labels in [self.bottomLeftContent, self.bottomRightContent] {
         
         labels.frame.origin.y = self.topY + 126
         labels.alpha = HomeLabel.content.alpha
         labels.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5)
         
      }
      
      // Animate the hint's up
      for hints in [self.bottomLeftHint, self.bottomRightHint] {
         
         hints.frame.origin.y = self.topY + 96
         
      }
      
   }
   
   private func nextToActiveCompletion() {
      
      // Animate the hint's
      for hints in [self.topTopHint, self.topLeftHint, self.topRightHint] {
         hints.alpha = HomeLabel.hint.alpha
         hints.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      }
      
      // Animte the content
      for content in [self.topTopContent, self.topLeftContent, self.topRightContent] {
         content.alpha = HomeLabel.content.alpha
         content.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      }
      
      // Animte the top hint and content
      self.topTopHint.text = "Exercise"
      self.topTopHint.frame.origin = CGPoint(x: self.topX, y: self.topY)
      
      self.topTopContent.text = self.currentSet.name
      self.topTopContent.frame.origin = CGPoint(x: self.topX, y: self.topY + 24)
      
      // Animate the left hint and content
      self.topLeftHint.text = "Reps"
      self.topLeftHint.frame.origin = CGPoint(x: self.leftX, y: self.topY + 96)
      
      self.topLeftContent.text = "\(self.currentSet._reps)"
      self.topLeftContent.frame.origin = CGPoint(x: self.leftX, y: self.topY + 120)
      
      // Animate the right hint and content
      self.topRightHint.text = "Weight"
      self.topRightHint.frame.origin = CGPoint(x: self.rightX, y: self.topY + 96)
      
      self.topRightContent.text = "\(Int(self.currentSet._weight))"
      self.topRightContent.frame.origin = CGPoint(x: self.rightX, y:self.topY + 120)
      
      self.bottomTopHint.frame.origin.y = self.bottomY
      self.bottomTopHint.text = "Rest"
      
      self.bottomTopContent.frame.origin.y = self.bottomY + 16
      self.bottomTopContent.text = self.currentSet._restTime.toString()
      self.bottomTopContent.alpha = HomeLabel.accent.alpha
      self.bottomTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      
      for labels in [self.bottomLeftHint, self.bottomRightHint] {
         labels.text = ""
         labels.frame.origin.y = self.bottomY + 52
      }
      
      for label in [self.bottomRightContent, self.bottomLeftContent] {
         label.text = ""
         label.frame.origin.y = self.bottomY + 68
         label.alpha = HomeLabel.accent.alpha
         label.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      }
      
      
   }
   
   private func doneCompletion() {
      
      self.topTopHint.alpha = HomeLabel.hint.alpha
      self.topTopHint.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.topTopHint.frame.origin = CGPoint(x: self.topX, y: self.topY)
      self.topTopHint.text = "Rest"
      
      self.topTopContent.alpha = HomeLabel.content.alpha
      self.topTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.topTopContent.frame.origin = CGPoint(x: self.topX, y: self.topY + 24)
      self.topTopContent.text = self.currentSet.restTime!.toString()
      
      self.bottomTopHint.text = ""
      self.bottomTopHint.frame.origin.y = self.bottomY
      
      self.bottomTopContent.frame.origin.y = self.bottomY + 16
      self.bottomTopContent.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      self.bottomTopContent.alpha = HomeLabel.accent.alpha
      self.bottomTopContent.text = ""
      
   }
   
}

// MARK: Geometry for labels layout
private extension HomeSetView {

   var topHeight: CGFloat {
      return (self.frame.height / 8 * 5)
   }
      
   var bottomHeight: CGFloat {
      return (self.frame.height / 8 * 3)
   }
      
   var topY: CGFloat {
      return (topRowCount == 2) ? (topHeight - 168) / 2 : (topHeight - 72) / 2
   }
      
   var bottomY: CGFloat {
      var y = (bottomRowCount == 2) ? (bottomHeight - 96) / 2 : (bottomHeight - 44) / 2
      y = y + topHeight
      return y
   }
   
   var leftX: CGFloat {
      return 16
   }
   
   var topX: CGFloat {
      return 16
   }
   
   var rightX: CGFloat {
      return self.frame.width / 2
   }
   
   var fullWidth: CGFloat {
      return self.frame.width - 32
   }
   
   var halfWidth: CGFloat {
      return self.frame.width / 2 - 16
   }

}








