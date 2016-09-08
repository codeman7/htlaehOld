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
   fileprivate lazy var topTopHint: HomeHint = HomeHint(frame: Rect(x: self.topX, y: self.topY, w: self.fullWidth, h: 16), active: true, location: .middle, destination: self.exitPoint)
   
   /// The property for the left label in the top half
   fileprivate lazy var topLeftHint: HomeHint = HomeHint(frame: Rect(x: self.leftX, y: self.topY + 96, w: self.halfWidth, h: 16), active: true, location: .left, destination: self.exitPoint)

   
   /// The property for the right label in the top half
   fileprivate lazy var topRightHint: HomeHint = HomeHint(frame: Rect(x: self.rightX, y: self.topY + 96, w: self.halfWidth, h: 16), active: true, location: .right, destination: self.exitPoint)
   
   /// The property for the top label in the top half
   lazy var topTopContent: HomeContent = HomeContent(frame: Rect(x: self.topX, y: self.topY + 24, w: self.fullWidth, h: 48), active: true, location: .middle, destination: self.exitPoint)
   
   /// The property for the left label in the top half
   fileprivate lazy var topLeftContent: HomeContent = HomeContent(frame: Rect(x: self.leftX, y: self.topY + 120, w: self.halfWidth, h: 48), active: true, location: .left, destination: self.exitPoint)
   
   /// The property for the right label in the top half
   fileprivate lazy var topRightContent: HomeContent = HomeContent(frame: Rect(x: self.rightX, y: self.topY + 120, w: self.halfWidth, h: 48), active: true, location: .right, destination: self.exitPoint)
   
   /// The property for the top label in the bottom half
   fileprivate lazy var bottomTopHint: HomeHint = HomeHint(frame: Rect(x: self.topX, y: self.bottomY, w: self.fullWidth, h: 16), active: false, location: .middle, destination: CGPoint(x: self.topX, y: self.topY))
   
   /// The property for the left label in the bottom half
   fileprivate lazy var bottomLeftHint: HomeHint = HomeHint(frame: Rect(x: self.leftX, y: self.bottomY + 52, w: self.halfWidth, h: 16), active: false, location: .left, destination: CGPoint(x: self.leftX, y: self.topY + 96))
   
   /// The property for the right label in the bottom half
   fileprivate lazy var bottomRightHint: HomeHint = HomeHint(frame: Rect(x: self.rightX, y: self.bottomY + 52, w: self.halfWidth, h: 16), active: false, location: .right, destination: CGPoint(x: self.rightX, y: self.topY + 96))
   
   /// The property for the top label in the bottom half
   fileprivate lazy var bottomTopContent: HomeAccent = HomeAccent(frame: Rect(x: self.topX, y: self.bottomY + 16, w: self.fullWidth, h: 28), active: false, location: .middle, destination: CGPoint(x: self.topX, y: self.topY + 30))
   
   /// The property for the left label in the bottom half
   fileprivate lazy var bottomLeftContent: HomeAccent = HomeAccent(frame: Rect(x: self.leftX, y: self.bottomY + 68, w: self.halfWidth, h: 28), active: false, location: .left, destination: CGPoint(x: self.leftX, y: self.topY + 126))
   
   /// The property for the right label in the bottom half
   fileprivate lazy var bottomRightContent: HomeAccent = HomeAccent(frame: Rect(x: self.rightX, y: self.bottomY + 68, w: self.halfWidth, h: 28), active: false, location: .right, destination: CGPoint(x: self.rightX, y: self.topY + 126))
   
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
   func initialLayoutFor(set: WeightSet) {
      
      // Add subviews
      self.insertViews()
      
      // Set all the top labels
      self.topTopContent.text = set.name
      self.topLeftContent.text = "\(set._reps)"
      self.topRightContent.text = "\(Int(set._weight))"
      
      // Set the bottom label
      self.bottomTopContent.text = set._restTime.toString()
      
   }
   
   fileprivate func insertViews() {
      
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
   func rest(set: WeightSet) {
      
      // Set the next set value to the set passed as variable
      self.nextSet = set
      
      // Update the row counts for each view
      self.topRowCount = 1
      self.bottomRowCount = 2
      
      // Animate the views
      UIView.animate(withDuration: 0.2, animations: {
         
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
      
      UIView.animate(withDuration: 0.2, animations: {
         
            self.nextToActiveAnimation()
         
         }, completion: { Bool in
            
            self.nextToActiveCompletion()

      })
      
   }
   
   
   
   fileprivate func startTimer() {
   
   }
   
   fileprivate func updateRest(_ amount: Double) {
      
      // Make sure the amount isn't going to be negative if so stop recursion
      guard amount > -1 else {
         return
      }
      
      // Set the text for the top content
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
         let color: UIColor = (amount.truncatingRemainder(dividingBy: 2) == 1) ? .black : .yellow
         self.topTopContent.textColor = color
      }

   }
   
}

// MARK: Animations
private extension HomeSetView {
   
   // This function is used to animate the rest up to the main view
   func showRest() {
      
      // Hide the top labels
      let topLabels: [Disappear] = [self.topTopHint, self.topLeftHint, self.topRightHint, self.topTopContent, self.topLeftContent, self.topRightContent]
      for top in topLabels {
         top.hide()
      }
      
      // Animate the bottom labels up
      self.bottomTopContent.moveUp()
      self.bottomTopHint.moveUp()
      
   }
   
   /// Completion block for current set going to rest
   func nextCompletion() {
      
      // Transform the views back to their original size
      let labels: [HomeLabelAbilities] = [self.topTopHint, self.topLeftHint, self.topRightHint, self.topTopContent, self.topLeftContent, self.topRightContent, self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint, self.bottomTopContent, self.bottomLeftContent, self.bottomRightContent]
      for label in labels {
         label.backToOrigin()
      }
      
      // Set the top hints to non active
      let topHints = [self.topTopHint, self.topLeftHint, self.topRightHint]
      for topHint in topHints { topHint.active = false }
      
      // Set the bottom hints to active
      let bottomHints = [self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint]
      for bottomHint in bottomHints { bottomHint.active = true }
      
      // Reset the text for all the hints
      for hints in topHints + bottomHints {
         hints.setText()
      }
      
      // Set the top content label
      self.topTopContent.text = self.currentSet.restTime!.toString()
      for topContent in [self.topLeftContent, self.topRightContent] {
         topContent.setToBlank()
      }
      
      // Set the alpha for the bottom content
      self.bottomTopContent.alpha = HomeLabel.accent.alpha
   
      // Set the bottom labels
      self.bottomTopContent.text = self.nextSet!.name
      self.bottomLeftContent.text = "\(self.nextSet!._reps)"
      self.bottomRightContent.text = "\(Int(self.nextSet!._weight))"
      
      // Start the rest timer
      self.startTimer()
      
   }
   
   func nextToActiveAnimation() {
      
      // Animate the top label's up and out of view
      let labels: [Disappear] = [self.topTopHint, self.topTopContent]
      for label in labels {
         label.hide()
      }
      
      // For all the bottom content move it up
      let bottomContent: [MoveUp] = [self.bottomTopContent, self.bottomLeftContent, self.bottomRightContent, self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint]
      for bottom in bottomContent {
         bottom.moveUp()
      }
      
      // For all the hint's move them back to their origin
      let topHints: [HomeLabelAbilities] = [self.topLeftHint, self.topRightHint]
      for hints in topHints {
         hints.backToOrigin()
      }
      
   }
   
   func nextToActiveCompletion() {
      
      // Resize the labels back to 1.0
      let labelsArr: [HomeLabelAbilities] = [self.bottomRightContent, self.bottomLeftContent, self.bottomTopContent, self.topTopContent, self.topLeftContent, self.topRightContent, self.topTopHint, self.topLeftHint, self.topRightHint, self.bottomLeftHint, self.bottomTopHint, self.bottomRightHint]
      for label in labelsArr {
         label.backToOrigin()
      }
      
      // Animte the alpha for the content
      for top in [self.topTopContent, self.topLeftContent, self.topRightContent] {
         top.alpha = HomeLabel.content.alpha
      }
      
      // Set the top hints to active
      let topHints = [self.topTopHint, self.topLeftHint, self.topRightHint]
      for topHint in topHints { topHint.active = true }
      
      // Set the bottom hints to nonactive
      let bottomHints = [self.bottomTopHint, self.bottomLeftHint, self.bottomRightHint]
      for bottomHint in bottomHints { bottomHint.active = false }
      
      // Reset the text for all the hints
      for hints in topHints + bottomHints {
         hints.setText()
      }
      
      // Set the top content labels text
      self.topTopContent.text = self.currentSet.name
      self.topLeftContent.text = "\(self.currentSet._reps)"
      self.topRightContent.text = "\(Int(self.currentSet._weight))"
      
      // Set the bottom content label's text
      self.bottomTopContent.text = self.currentSet._restTime.toString()
      
      // Set the alpha for all the bottom content
      for content in [self.bottomTopContent, self.bottomRightContent, self.bottomLeftContent] {
         content.alpha = HomeLabel.accent.alpha
      }
      
      // Set the text to blank
      for bottom in [self.bottomRightContent, self.bottomLeftContent] {
         bottom.setToBlank()
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






