//
//  FilterSheet.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class FilterSheet : BottomSheet {
   
   // MARK: Properties
   
   /// The reps slider
   lazy var repsSlider: TwoWaySlider = self.createSlider(at: 74, values: (min: self.initialValues.rMin, max: self.initialValues.rMax))
   /// The weight slider
   lazy var weightSlider: TwoWaySlider = self.createSlider(at: 165, values: (min: self.initialValues.wMin, max: self.initialValues.wMax))
   /// The reps min hint
   private lazy var repsMinHint: UILabel = self.addHint(at: CGPoint(x: 8, y: 45), text: "\(self.repsSlider.absoluteMin)")
   /// The reps max hint
   private lazy var repsMaxHint: UILabel = self.addHint(at: CGPoint(x: self.frame.width - 40, y: 45), text: "\(self.repsSlider.absoluteMax)")
   /// The weight min hint
   private lazy var weightMinHint: UILabel = self.addHint(at: CGPoint(x: 8, y: 136), text: "\(self.weightSlider.absoluteMin)")
   /// The weight max hint
   private lazy var weightMaxHint: UILabel = self.addHint(at: CGPoint(x: self.frame.width - 40, y: 136), text: "\(self.weightSlider.absoluteMax)")
   
   /// Variable for all the values
   var values: (rMin: Int, rMax: Int, wMin: Int, wMax: Int) {
      get {
         let rMin: Int = Int(self.repsMinHint.text!) ?? 0
         let rMax: Int = Int(self.repsMaxHint.text!) ?? Int.max
         let wMin: Int = Int(self.weightMinHint.text!) ?? 0
         let wMax: Int = Int(self.weightMaxHint.text!) ?? Int.max
         return (rMin: rMin, rMax: rMax, wMin: wMin, wMax: wMax)
      }
   }
   
   var initialValues: (rMin: Int, rMax: Int, wMin: Int, wMax: Int) = (rMin: 0, rMax: Int.max, wMin: 0, wMax: Int.max)
   
   /**
    The action for the filter button
    - note: Set before calling `addContent()`
   */
   var action: () -> () = { print("Please update filter button action") }
   
   /// The array of all the views
   private var views: [(view: UIView, alpha: CGFloat)] = []
   
   // MARK: Initializer
   /// NONE
   
   // MARK: Functions
   /// This function shows all the views by animating their alpha component to what it should be
   func showViews() {
      
      // Animate the views
      UIView.animateWithDuration(0.175, animations: {
         // Iterate over all the views and set the view to the alpha corresponding with it
         for view in self.views {
            view.view.alpha = view.alpha
         }
         
      })
      
   }
   
   /**
   Add's all the content to the view
    - note: Set the action property before calling this method
   */
   func addContent() {
      
      // Add the button
      self.addFilterButton()
      
      // Add all reps / weight related content
      self.addReps()
      self.addWeight()
      
   }
   
   /// Adds the filter button to the bottom of the view
   private func addFilterButton() {

      let frame: CGRect = CGRect(x: (self.frame.w - 124) / 2, y: self.sheet.frame.h - 60, w: 124, h: 40)
      let button: Button = Button(frame: frame, type: .raised)
      
      button.backgroundColor = .yellow
      button.set(title: "filter", color: .black)
      
      button.alpha = 0.0
      button.action = self.action
      
      self.sheet.addSubview(button)
      self.views += [(view: button as UIView, alpha: 1.0)]
      
   }
   
   private func addReps() {
      
      self.sheet.addSubview(self.repsSlider)
      self.addLabel(at: 42, text: "Reps")
      self.sheet.addSubview(self.repsMinHint)
      self.sheet.addSubview(self.repsMaxHint)
      
   }
   
   private func createSlider(at y: CGFloat, values: (min: Int, max: Int)) -> TwoWaySlider {
      
      let frame: CGRect = CGRect(x: 8, y: y, w: self.frame.w - 16, h: 48)
      let twoWay: TwoWaySlider = TwoWaySlider(frame: frame, values: values)
      twoWay.alpha = 0.0
      self.views += [(view: twoWay as UIView, alpha: 1.0)]
      return twoWay
      
   }
   
   /// Creates the labels for "Reps" and "Weight"
   private func addLabel(at y: CGFloat, text: String) {
      
      let frame: CGRect = CGRect(x: (self.frame.w - 120) / 2, y: y, w: 120, h: 24)
      let label: UILabel = UILabel(frame: frame, font: .medium20, align: .Center, color: .black)
      label.alpha = 0.0
      label.text = text
      self.views += [(view: label as UIView, alpha: 0.87)]
      self.sheet.addSubview(label)
      
   }
   
   /// Method to create all the hints
   private func addHint(at origin: CGPoint, text: String) -> UILabel {
      
      // Set the frame for the label and create the label
      let frame: CGRect = CGRect(origin: origin, size: CGSize(width: 32, height: 19))
      let label: UILabel = UILabel(frame: frame, font: .regular16, align: .Center, color: .black)
      
      // Set the text for the label and add it to the view's array
      label.text = text
      self.views += [(view: label as UIView, alpha: 1.0)]
      
      // Return the label
      return label
      
   }
   
   /// Adds all the weight related subviews
   private func addWeight() {
      
      // Add the slider and the label
      self.sheet.addSubview(self.weightSlider)
      self.addLabel(at: 133, text: "Weight")
      
      // Add both hints
      self.sheet.addSubview(weightMinHint)
      self.sheet.addSubview(weightMaxHint)
      
   }
   
}

extension FilterSheet {
   
   override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      super.touchesBegan(touches, withEvent: event)

   }
   
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
      super.touchesMoved(touches, withEvent: event)
      self.repsMinHint.text = "\(self.repsSlider.min)"
      self.repsMaxHint.text = "\(self.repsSlider.max)"
      self.weightMinHint.text = "\(self.weightSlider.min)"
      self.weightMaxHint.text = "\(self.weightSlider.max)"
      
   }
   
   
}






