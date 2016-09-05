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
   private lazy var topTopHint: HomeHint = HomeHint(frame: Rect(x: self.topX, y: self.topY, w: self.fullWidth, h: 16), active: true, location: .Middle, destination: self.exitPoint)
   
   /// The property for the left label in the top half
   private lazy var topLeftHint: HomeHint = HomeHint(frame: Rect(x: self.leftX, y: self.topY + 96, w: self.halfWidth, h: 16), active: true, location: .Left, destination: self.exitPoint)

   
   /// The property for the right label in the top half
   private lazy var topRightHint: HomeHint = HomeHint(frame: Rect(x: self.rightX, y: self.topY + 96, w: self.halfWidth, h: 16), active: true, location: .Right, destination: self.exitPoint)
   
   /// The property for the top label in the top half
   lazy var topTopContent: HomeContent = HomeContent(frame: Rect(x: self.topX, y: self.topY + 24, w: self.fullWidth, h: 48), active: true, location: .Middle, destination: self.exitPoint)
   
   /// The property for the left label in the top half
   private lazy var topLeftContent: HomeContent = HomeContent(frame: Rect(x: self.leftX, y: self.topY + 120, w: self.halfWidth, h: 48), active: true, location: .Left, destination: self.exitPoint)
   
   /// The property for the right label in the top half
   private lazy var topRightContent: HomeContent = HomeContent(frame: Rect(x: self.rightX, y: self.topY + 120, w: self.halfWidth, h: 48), active: true, location: .Right, destination: self.exitPoint)
   
   /// The property for the top label in the bottom half
   private lazy var bottomTopHint: HomeHint = HomeHint(frame: Rect(x: self.topX, y: self.bottomY, w: self.fullWidth, h: 16), active: false, location: .Middle, destination: CGPoint(x: self.topX, y: self.topY))
   
   /// The property for the left label in the bottom half
   private lazy var bottomLeftHint: HomeHint = HomeHint(frame: Rect(x: self.leftX, y: self.bottomY + 52, w: self.halfWidth, h: 16), active: false, location: .Left, destination: CGPoint(x: self.leftX, y: self.bottomY + 52))
   
   /// The property for the right label in the bottom half
   private lazy var bottomRightHint: HomeHint = HomeHint(frame: Rect(x: self.rightX, y: self.bottomY + 52, w: self.halfWidth, h: 16), active: false, location: .Right, destination: CGPoint(x: self.rightX, y: self.bottomY + 52))
   
   /// The property for the top label in the bottom half
   private lazy var bottomTopContent: HomeAccent = HomeAccent(frame: Rect(x: self.topX, y: self.bottomY + 16, w: self.fullWidth, h: 28), active: false, location: .Middle, destination: CGPoint(x: self.topX, y: self.bottomY + 16))
   
   /// The property for the left label in the bottom half
   private lazy var bottomLeftContent: HomeAccent = HomeAccent(frame: Rect(x: self.leftX, y: self.bottomY + 68, w: self.halfWidth, h: 28), active: false, location: .Left, destination: CGPoint(x: self.leftX, y: self.bottomY + 68))
   
   /// The property for the right label in the bottom half
   private lazy var bottomRightContent: HomeAccent = HomeAccent(frame: Rect(x: self.rightX, y: self.bottomY + 68, w: self.halfWidth, h: 28), active: false, location: .Right, destination: CGPoint(x: self.rightX, y: self.bottomY + 68))
   
   /// The number of rows in the top sectoin
   var topRowCount: Int = 2
   
   /// The number of rows in the bottom section
   var bottomRowCount: Int = 1
   
   lazy var exitPoint: CGPoint = CGPoint(x: self.frame.w / 2, y: 0)

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
      This function moves the rest timer up for the very last set
   */
   func finished() {
      print("All done with set view")
      self.removeFromSuperview()
      
   }
   
   /**
    This function moves the next set up and gets rid of rest property for the last set
   */
   func next() {

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
   
   private func showRest() {
      
      // Hide the top labels
      let topLabels: [Disappear] = [self.topTopHint, self.topLeftHint, self.topRightHint, self.topTopContent, self.topLeftContent, self.topRightContent]
      for top in topLabels {
         top.hide()
      }
      
      // Animate the bottom labels up
      self.bottomTopContent.moveUp()
      self.bottomTopHint.moveUp()
      
   }
   
   private func startTimer() {
   
   }
   
   private func updateRest(amount: Double) {
      
      // Make sure the amount isn't going to be negative if so stop recursion
      guard amount > -1 else {
         return
      }
      
      // Pass the update to another thread
      // Update the label
      let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
      dispatch_async(dispatch_get_global_queue(priority, 0)) {
         // do some task
         dispatch_async(dispatch_get_main_queue()) {
            // update some UI
            self.topTopContent.text = amount.toString()
         }
      }
      

      
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

   }
   
}

// MARK: Animations
private extension HomeSetView {
   
   /// Completion block for current set going to rest
   private func nextCompletion() {
      
      // Transform the views back to their original size
      let labels: [HomeLabelAbilities] = [self.topTopHint, self.topLeftHint, self.topRightHint, self.topTopContent, self.topLeftContent, self.topRightContent, self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint, self.bottomTopContent, self.bottomLeftContent, self.bottomRightContent]
      for label in labels {
         label.backToOrigin()
      }
      
      // Set the hint's text
      let hints: [HomeHint] = [self.topTopHint, self.topLeftHint, self.topRightHint, self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint]
      for hint in hints {
         hint.setText()
      }
      
      self.topTopContent.text = self.currentSet.restTime!.toString()
      
      self.bottomTopContent.text = self.nextSet!.name
      
      self.bottomLeftContent.text = "\(self.nextSet!._reps)"
      
      self.bottomRightContent.text = "\(Int(self.nextSet!._weight))"
      
      // Start the rest timer
      self.startTimer()
      
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
      self.topHintToOrigin()
      
   }
   
   private func nextToActiveCompletion() {
      
      // Resize the labels back to 1.0
      let labelsArr: [UILabel] = [self.bottomRightContent, self.bottomLeftContent, self.bottomTopContent, self.topTopContent, self.topLeftContent, self.topRightContent, self.topTopHint, self.topLeftHint, self.topRightHint]
      self.backToOriginalSize(labels: labelsArr)
      
      // Animate the alpha for the hints
      self.setLabelsAlpha(labels: [self.topTopHint, self.topLeftHint, self.topRightHint], alpha: HomeLabel.hint.alpha)
      
      // Animte the alpha for the content
      self.setLabelsAlpha(labels: [self.topTopContent, self.topLeftContent, self.topRightContent], alpha: HomeLabel.content.alpha)
      
      // Animte the top hint and content
      self.topTopHint.text = "Exercise"
      self.topTopHint.frame.origin = CGPoint(x: self.topX, y: self.topY)
      
      self.topTopContent.text = self.currentSet.name
      self.topTopContent.frame.origin = CGPoint(x: self.topX, y: self.topY + 24)
      
      // Animate the left hint and content
      self.topLeftHint.text = "Reps"
      self.topLeftHint.frame.origin.x = self.leftX
      
      self.topLeftContent.text = "\(self.currentSet._reps)"
      self.topLeftContent.frame.origin = CGPoint(x: self.leftX, y: self.topY + 120)
      
      // Animate the right hint and content
      self.topRightHint.text = "Weight"
      self.topRightHint.frame.origin.x = self.rightX
      
      // Move both hints back to 96
      self.topHintToOrigin()
      
      self.topRightContent.text = "\(Int(self.currentSet._weight))"
      self.topRightContent.frame.origin = CGPoint(x: self.rightX, y:self.topY + 120)
      
      self.bottomTopHint.frame.origin.y = self.bottomY
      self.bottomTopHint.text = "Rest"
      
      self.bottomTopContent.frame.origin.y = self.bottomY + 16
      self.bottomTopContent.text = self.currentSet._restTime.toString()
      
      self.setLabelsAlpha(labels: [self.bottomTopContent, self.bottomRightContent, self.bottomLeftContent], alpha: HomeLabel.accent.alpha)
      
      // Set the bottom hint's the the propery y position
      self.bottomBottomLabelsToProperY()
      
      // Set the text to blank
      self.blankTextFor(labels: [self.bottomRightContent, self.bottomLeftContent, self.bottomLeftHint, self.bottomRightHint])
      
      self.bottomContentToOrigin()
      
   }
   
   // MARK: Helpers for animations
  
   
   private func setLabelsAlpha(labels labels: [UILabel], alpha: CGFloat) {
      
      for label in labels {
         label.alpha = alpha
      }
      
   }
   
   private func blankTextFor(labels labels: [UILabel]) {
      
      for label in labels {
         label.text = ""
      }
      
   }
   
   private func backToOriginalSize(labels labels: [UILabel]) {
      
      for label in labels {
         label.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
      }
   
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








