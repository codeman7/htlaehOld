//
//  SetView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/26/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

enum Location {
   case top
   case left
   case right
}

/**
 This class is for an active set view on the homepage
 */
class ActiveSetView : UIView {
   
   // MARK: Properties
   /// The property for the location that the views will move to
   private let exitLocation: CGPoint
   /// The property for the color if a set is completed
   var completeColor: UIColor = .blue
   /// The property for the color if a set is skipped
   var skippedColor: UIColor = .red
   /// The property for the top hint
   var topHint: UILabel = UILabel()
   /// The property for the top label
   var topLabel: UILabel = UILabel()
   /// The property for the left hint
   var leftHint: UILabel = UILabel()
   /// The property for the left label
   var leftLabel: UILabel = UILabel()
   /// The property for the right hint
   var rightHint: UILabel = UILabel()
   /// The property for the right label
   var rightLabel: UILabel = UILabel()
   
   // MARK: Initializers
   /**
    Default intializer
    - parameter view: The view that will hold the active set
    - parameter titles: The titles for all the labels
   */
   init(view: UIView, titles: [Location : (hint: SetVariable, label: String)]) {
      
      // Set the exit location and the frame for the view
      self.exitLocation = CGPoint(x: view.frame.w / 2, y: 0)
      let frame: Rect = Rect(x: 0, y: 96, w: view.frame.w, h: (view.frame.h - (72 + 96)) / 3 * 2)
      
      // Call the super initializer and layout the views
      super.init(frame: frame)
      self.layoutLabels(titles: titles)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
    Lays out the labels
    */
   func layoutLabels(titles titles: [Location: (hint: SetVariable, label: String)]) {
      
      // Layout the top labels
      self.layoutTop(titles[.top]!)
      
      // Layout the left labels
      self.layoutLeft(titles[.left]!)
      
      // Layout the right labels
      self.layoutRight(titles[.right]!)
      
   }
   
   /**
      This function moves the views from their given location to the 'exit' location
      
      Should animate the view to that location, fade them out with their alpha property and fade their color
      - parameter complete: If the set is complete or skipped update color accordingly
   */
   func exit(complete: Bool) {
      
      print(self.frame)
      print(self.exitLocation)
      let color: UIColor = (complete == true) ? .blue : .red
      UIView.animateWithDuration(1.25, delay: 0.0, options: .CurveEaseInOut, animations: {
         for views in self.subviews {
            views.alpha = 0.0
            views.frame = Rect(x: self.exitLocation.x, y: self.exitLocation.y, w: 0, h: 0)
            
         }
      }, completion: nil)
      
      
   }
   
   
   /**
    Resets the views to their start location and updatees the labels
    */
   func resetTo(titles: [Location : (hint: SetVariable, label: String)]) {
      
   }
   
   private func layoutTop(titles: (hint: SetVariable, label: String)) {
      
      // Create the label and add it as a subview
      self.topHint = UILabel(frame: self.frame.topHint(), properties: HomeLabel.hint, title: titles.hint.rawValue)
      self.addSubview(self.topHint)
      
      // Create the label and add it as subview
      self.topLabel = UILabel(frame: self.frame.topLabel(), properties: HomeLabel.content, title: titles.label)
      self.addSubview(self.topLabel)
      
   }
   
   
   private func layoutLeft(titles: (hint: SetVariable, label: String)) {
      
      // Create the label and add it as a subview
      self.leftHint = UILabel(frame: self.frame.leftHint(), properties: HomeLabel.hint, title: titles.hint.rawValue)
      self.addSubview(self.leftHint)
      
      // Create the label and add it as a subview
      self.leftLabel = UILabel(frame: self.frame.leftLabel(), properties: HomeLabel.content, title: titles.label)
      self.addSubview(self.leftLabel)
   }
   
   private func layoutRight(titles: (hint: SetVariable, label: String)) {
      
      // Create the label and add it as a subview
      self.rightHint = UILabel(frame: self.frame.rightHint(), properties: HomeLabel.hint, title: titles.hint.rawValue)
      self.addSubview(self.rightHint)
      
      // Create the label and add it as a subview
      self.rightLabel = UILabel(frame: self.frame.rightLabel(), properties: HomeLabel.content, title: titles.label)
      self.addSubview(self.rightLabel)
      
   }
}

private extension UILabel {
   
   convenience init(frame: CGRect, properties: HomeLabel, title: String) {
      self.init(frame: frame, properties: properties)
      self.text = title
   }
   
}

private extension Rect {
   
   func topHint() -> Rect {
      return Rect(x: 16, y: (self.h - 168) / 2, w: self.w - 32, h: 16)
   }
   
   func topLabel() -> Rect {
      return Rect(x: 16, y: ((self.h - 168) / 2) + 24, w: self.w - 32, h: 48)
   }
   
   func leftHint() -> Rect {
      return Rect(x: 16, y: ((self.h - 168) / 2) + 96, width: (self.w - 32) / 2, height: 16)
   }
   
   func leftLabel() -> Rect {
      return Rect(x: 16, y: ((self.h - 168) / 2) + 120, width: (self.w - 32) / 2, height: 48)
   }
   
   func rightHint() -> Rect {
      return Rect(x: self.w / 2, y: ((self.h - 168) / 2) + 96, width: (self.w - 32) / 2, height: 16)
   }
   
   func rightLabel() -> Rect {
      return Rect(x: self.w / 2, y: ((self.h - 168) / 2) + 120, width: (self.w - 32) / 2, height: 48)
   }
   
}