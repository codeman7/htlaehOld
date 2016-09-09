//
//  WorkoutLabels.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/11/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

/**
   This struct is for column headers that hold text above a workout table
 */
struct WorkoutTableColumnHeadString : TextPresentable {
   let alignment: NSTextAlignment = .Left
   let font: UIFont = Fonts.Medium.twelve
   let color: UIColor = .black
   let alpha: CGFloat = 0.54
}

/**
   This struct is for column headers that hold numbers above a workout table
 */
struct WorkoutTableColumnHeadNumber : TextPresentable {
   let alignment: NSTextAlignment = .Right
   let font: UIFont = Fonts.Medium.twelve
   let color: UIColor = .black
   let alpha: CGFloat = 0.54
}

/**
   This struct is for content in workout tables that hold Strings
 */
struct WorkoutContentStringLabel : TextPresentable {
   let alpha: CGFloat = 0.87
   let alignment: NSTextAlignment = .Left
   let color: UIColor = .black
   let font: UIFont = Fonts.Regular.fourteen
}

/**
   This struct is for conent in a workout table that holds numbers
 */
struct WorkoutContentNumberLabel : TextPresentable {
   let alpha: CGFloat = 0.87
   let alignment: NSTextAlignment = .Right
   let color: UIColor = .black
   let font: UIFont = Fonts.Regular.fourteen
}
