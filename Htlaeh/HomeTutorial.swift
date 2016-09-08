//
//  HomeTutorial.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/5/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This struct is used for the steps of the home tutorial
 */
struct HomeTutorial : Tutorial {
   
   func firstStep(controllerView view: UIView) -> [ViewRepresentable] {
      
      let cirlce: CAShapeLayer = self.createLayer(controllerView: view)
      let labels: [ViewRepresentable] = self.createText(controllerView: view)
      return [cirlce] + labels
      
   }
   
   fileprivate func createLayer(controllerView view: UIView) -> CAShapeLayer {
      
      let circlePath: UIBezierPath = UIBezierPath(arcCenter: CGPoint(x: 36, y: 47), radius: view.frame.width / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
      let circleShape: CAShapeLayer = CAShapeLayer()
      circleShape.path = circlePath.cgPath
      circleShape.fillColor = UIColor.clear.cgColor
      circleShape.lineWidth = view.frame.width - 80
      circleShape.strokeColor = Color.blue.cgColor
      circleShape.opacity = 0.87
      return circleShape
      
   }
   
   fileprivate func createText(controllerView view: UIView) -> [ViewRepresentable] {
      
      let title: ViewRepresentable = self.createTitle(controllerView: view) as ViewRepresentable
      let message: ViewRepresentable = self.createMessage(controllerView: view) as ViewRepresentable
      return [title, message]
      
   }
   
   fileprivate func createTitle(controllerView view: UIView) -> UILabel {
      
      let text: String = "Menu"
      let frame: CGRect = CGRect(x: 88, y: 92, width: 165, height: 28)
      let label: UILabel = UILabel(frame: frame, font: Fonts.Medium.twentyFour, align: .left, color: .white)
      label.text = text
      return label
      
   }
   
   fileprivate func createMessage(controllerView view: UIView) -> UILabel {
      
      let text: String = "Tap the menu icon to navigate within the app & change settings"
      let height: CGFloat = text.heightWithConstrainedWidth(165, font: Fonts.Regular.sixteen)
      let frame: CGRect = CGRect(x: 88, y: 136, width: 165, height: height)
      let label: UILabel = UILabel(frame: frame, font: Fonts.Regular.sixteen, align: .left, color: .white)
      label.alpha = 0.74
      label.text = text
      label.multipleLines()
      return label
      
   }
   
}
