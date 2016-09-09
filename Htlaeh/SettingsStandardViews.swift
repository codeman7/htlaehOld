//
//  SettingsStandardViews.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/1/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import UIKit

struct SettingsStandardViews : ViewsStruct {
   
   // MARK: Properties
   /// The property that will hold all the views
   let controller: Settings
   
   /// The property that will set the view's delays and alphas
   var views: [UIView : (delay: Double, alpha: CGFloat)] = [:]
   
   init<T : Controller>(controller: T) {
      
      // Set the controller property
      self.controller = controller as! Settings
      
   }
   
   // Helper initializer
   init(controller: Settings) {
      
      // Set the controller property
      self.controller = controller
      
   }
   
   /// Function to layout all the views and add them to the view property
   mutating func layoutViews() {
      
      // Get the header and add it to the views property
      let header: BoldHeader = self.createHeader()
      self.views[header] = (delay: 0.0, alpha: 1.0)
      
      // Get the button and add it to the views property
      let button: Button = self.createLogoutButton()
      self.views[button] = (delay: 0.06, alpha: 1.0)
      
      self.views += self.addNotification()
      
      self.views += self.addGoals()
      
   }
   
}


// MARK:
extension SettingsStandardViews {
   
   /// Create the header
   private func createHeader() -> BoldHeader {
      
      // Create the frame for the header and the header options
      let frame: Rect = Rect(x: 0, y: 0, w: self.controller.width, h: 70)
      let headerOptions: HeaderType = HeaderType.settings(self.controller)
      
      // Create the header and add it as a subview
      let header: BoldHeader = BoldHeader(frame: frame, options: headerOptions)
      self.controller.view.addSubview(header)
      
      // Return the headers
      return header
      
   }
   
   /// Create the bottom log out button
   private func createLogoutButton() -> Button {
      
      // Create the frame for the button and the button
      let frame: Rect = Rect(x: (self.controller.width - 124) / 2, y: self.controller.height - 64, w: 124, h: 40)
      let button: Button = Button(frame: frame, type: .raised)
      
      // Set the background color and title for the button
      button.backgroundColor = .red
      button.set(title: "LOG OUT", color: .white)
      
      // Set the action and alpha for the button
      button.action = { self.controller.logout() }
      button.alpha = 0.0
      
      // Add the button as a subview and return the button
      self.controller.view.addSubview(button)
      return button
      
   }
   
   func addNotification() -> [UIView : (delay: Double, alpha: CGFloat)] {
      
      let values: UserDefaults = UserDefaults()
      
      var dict: [UIView: (delay: Double, alpha: CGFloat)] = [:]
      
      let notificationFrame: Rect = Rect(x: 16, y: 92, w: self.controller.width - 32, h: 22)
      let notifications: UILabel = UILabel(frame: notificationFrame, properties: SettingsLabel.hint)
      notifications.text = "Notifications"
      notifications.alpha = 0.0
      self.controller.view.addSubview(notifications)
      
      dict[notifications] = (delay: 0.025, alpha: SettingsLabel.hint.alpha)
      
      let workoutTimeFrame: Rect = Rect(x: 16, y: 127, w: self.controller.width - 120, h: 24)
      let workoutTime: UILabel = UILabel(frame: workoutTimeFrame, properties: SettingsLabel.standard)
      workoutTime.alpha = 0.0
      workoutTime.text = "Workout time"
      self.controller.view.addSubview(workoutTime)
      
      dict[workoutTime] = (delay: 0.03, alpha: SettingsLabel.standard.alpha)
      
      let workoutSwitch: SwitchView = SwitchView(origin: CGPoint(x: self.controller.width - 58, y: 126), value: values.queryForBool(.timeAlert)!, color: .blue)
      workoutSwitch.alpha = 0.0
      workoutSwitch.action = { self.controller.updateTimeBool(workoutSwitch.value) }
      self.controller.view.addSubview(workoutSwitch)
      
      let timeLabelFrame: Rect = Rect(x: 16, y: 163, w: self.controller.width / 2 - 16, h: 24)
      let timeLabel: UILabel = UILabel(frame: timeLabelFrame, properties: SettingsLabel.standard)
      timeLabel.alpha = 0.0
      timeLabel.text = "Time"
      self.controller.view.addSubview(timeLabel)
      
      dict[timeLabel] = (delay: 0.025, alpha: 0.54)
      
      let timeFrame: Rect = Rect(x: self.controller.width / 2, y: 163, w: self.controller.width / 2 - 16, h: 24)
      let time: UILabel = UILabel(frame: timeFrame, properties: SettingsLabel.standard)
      time.alpha = 0.0
      time.textAlignment = .Right
      time.text = values.queryForString(.time)!
      self.controller.view.addSubview(time)
      
      dict[time] = (delay: 0.025, alpha: SettingsLabel.standard.alpha)
      
      
      
      dict[workoutSwitch] = (delay: 0.0, alpha: 1.0)
      
      let nextSetFrame: Rect = Rect(x: 16, y: 219, w: self.controller.width - 32, h: 24)
      let nextSet: UILabel = UILabel(frame: nextSetFrame, properties: SettingsLabel.standard)
      nextSet.alpha = 0.0
      nextSet.text = "Next set audio"
      self.controller.view.addSubview(nextSet)
      
      dict[nextSet] = (delay: 0.04, alpha: SettingsLabel.standard.alpha)
      
      let nextSwitch: SwitchView = SwitchView(origin: CGPoint(x: self.controller.width - 58, y: 221), value: values.queryForBool(.audio)!, color: .blue)
      nextSwitch.alpha = 0.0
      nextSwitch.action = { self.controller.updateNextAudio(nextSwitch.value) }
      self.controller.view.addSubview(nextSwitch)
      
      dict[nextSwitch] = (delay: 0.04, alpha: 1.0)
      
      
      return dict
      
   }
   
   func addGoals() -> [UIView : (delay: Double, alpha: CGFloat)] {
      
      var dict: [UIView: (delay: Double, alpha: CGFloat)] = [:]
      
      let goalsFrame: Rect = Rect(x: 16, y: 271, w: self.controller.width - 32, h: 22)
      let goals: UILabel = UILabel(frame: goalsFrame, properties: SettingsLabel.hint)
      goals.text = "Goals"
      goals.alpha = 0.0
      self.controller.view.addSubview(goals)
      
      dict[goals] = (delay: 0.06, alpha: SettingsLabel.hint.alpha)
      
      let daysPerWeekFrame: Rect = Rect(x: 16, y: 306, w: self.controller.width - 32, h: 24)
      let days: UILabel = UILabel(frame: daysPerWeekFrame, properties: SettingsLabel.standard)
      days.text = "Days per week"
      days.alpha = 0.0
      self.controller.view.addSubview(days)
      
      dict[days] = (delay: 0.075, alpha: SettingsLabel.standard.alpha)
      
      let lowerFrame: Rect = Rect(x: self.controller.width - 136, y: 298, w: 40, h: 40)
      let lower: Button = Button(frame: lowerFrame, type: .flat)
      
      lower.action = { print("Lower days per week") }
      lower.add(Images.Content.remove, color: .blue)
      
      lower.alpha = 0.0
      self.controller.view.addSubview(lower)
      
      dict[lower] = (delay: 0.075, alpha: 1.0)
      
      let raiseFrame: Rect = Rect(x: self.controller.width - 56, y: 298, w: 40, h: 40)
      let raise: Button = Button(frame: raiseFrame, type: .flat)
      
      raise.action = { print("Raise the number of days per week") }
      raise.add(Images.Content().add, color: .blue)
      
      raise.alpha = 0.0
      self.controller.view.addSubview(raise)
      
      dict[raise] = (delay: 0.075, alpha: 1.0)
      
      let daysFrame: Rect = Rect(x: self.controller.width - 96, y: 306, w: 40, h: 24)
      let daysValue: UILabel = UILabel(frame: daysFrame, properties: SettingsLabel.standard)
      let value = UserDefaults().queryForInt(.numberOfDays)
      daysValue.text = "\(value!)"
      daysValue.alpha = 0.0
      daysValue.textAlignment = .Center
      
      self.controller.view.addSubview(daysValue)
      dict[daysValue] = (delay: 0.075, alpha: SettingsLabel.standard.alpha)
      
      
      return dict
      
   }
   
}
