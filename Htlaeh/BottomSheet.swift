//
//  BottomSheet.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/12/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

class BottomSheet : UIView {
   
   // MARK: Properties
   
   // the property for the background grey
   lazy var backgroundGray: BackgroundGrey = self.createBackgroundGrey()
   // The bottom sheet property
   lazy var sheet: UIView = self.createSheet()
   // The height for the bottom sheet
   private let height: CGFloat
   
   // MARK: Initializers
   
   /**
    Default and only initializer
    parameter viewableFrame: The size of the screen for the device
    parameter height: The height that the view will be when show
   */
   init(viewableFrame: Rect, height: CGFloat) {
      
      // Set the height property
      self.height = height
      // The frame for the view
      let frame: Rect = Rect(x: viewableFrame.origin.x, y: viewableFrame.origin.y, w: viewableFrame.w, h: viewableFrame.h + height)
      // Call the super initializer
      super.init(frame: frame)
      
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   
   /**
    This function is used to show the view
   */
   func show() {
      //fatalError("Please subclass the show() method")
      if backgroundGray.superview == nil {
         self.addSubview(backgroundGray)
         self.addSubview(sheet)
      }
      
      self.backgroundGray.show(0.26)
      self.sheet.elevate(-16.0)
      UIView.animateWithDuration(0.225, delay: 0.0, options: .CurveEaseIn, animations: {
         self.sheet.frame.origin.y = self.frame.h - 568
         }, completion: nil)
      
   }
   
   /**
    This function is used to hide the view
   */
   func hide() {
      
      UIView.animateWithDuration(0.225, delay: 0.0, options: .CurveEaseOut, animations: {
         self.sheet.frame.origin.y = self.frame.h - 284
         self.backgroundGray.alpha = 0.0
         self.sheet.elevate(0.0)
         }, completion: { Bool in self.removeFromSuperview() })
      
   }
   
}

// MARK: Creation method for views
extension BottomSheet {
   
   private func createBackgroundGrey() -> BackgroundGrey {
      
      // Set the frame for the background and create the background
      let frame: Rect = Rect(origin: self.frame.origin, size: self.frame.size)
      let grey: BackgroundGrey = BackgroundGrey(frame: frame)
      
      // Set the action for the background and return the gray
      //grey.action = { self.hide() }
      return grey
      
   }
   
   private func createSheet() -> UIView {
      
      // Set the frame for the sheet and create the sheet
      let frame: Rect = Rect(x: 0, y: self.frame.h - self.height, w: self.frame.w, h: self.height)
      let view: UIView = UIView(frame: frame)
      
      // Set the background and elevation for the view
      view.backgroundColor = .white
      view.elevate(16.0)
      
      // Return the view
      return view
      
   }
   
}