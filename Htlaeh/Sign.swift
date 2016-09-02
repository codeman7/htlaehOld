//
//  ViewController.swift
//  Htlaeh
//
//  Created by Cody Weaver on 5/31/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit
import DigitsKit

class Sign: Controller {
   
//   var digits: Digits? = nil
   lazy var signButton: Button = {
      return SignStandardViews(controller: self).createSignButton()
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func digitsSignIn() {
      
      let digits = Digits.sharedInstance()
      let config = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
      config.appearance = TwitterDigits().digitsApperance()
      digits.authenticateWithViewController(nil, configuration: config, completion: { (session, error) in
         if let session = session {
            self.storeInKeychain(uid: session.userID, number: session.phoneNumber)
         }
      })
      
   }
   
   func storeInKeychain(uid uid: String, number: String) {
      
      let account = Account(id: uid, number: number)
      if account.store() == nil {
         self.segueToHome()
      } else {
         print("An error occured in storing in the keychain")
         self.showError()
      }
   }
   
   func skipSignIn() {
      
      let dialogFrame: CGRect = CGRect(x: self.width / 2 - 120, y: self.height / 2 - 220, width: 240, height: 425)
      let dialog: AccountDialog = AccountDialog(frame: self.view.frame, promptFrame: dialogFrame, action1: { self.signOut() }, action2: { self.digitsSignIn() })
      self.view.addSubview(dialog)
      dialog.showView()
    
   }
   
   func showError() {
      
   }
   
   func signOut() {
      
      let digits = Digits.sharedInstance()
      digits.logOut()
      
   }
   
   func segueToHome() {
      
      let defaults: UserDefaults = UserDefaults()
      defaults.defaultValues()
      self.animate()
      let delay: Delay = Delay()
      delay.delay(3.0, closure: {
         self.getHomeViews()
      })
      
      
   }
      
   private func getHomeViews() {
      
      let circleView: CircularView = CircularView(point: CGPoint(x: self.width / 2 - 1, y: self.height - 220), color: .white)
      self.view.addSubview(circleView)
      circleView.grow()
      let home: Home = Home()
      let d: Delay = Delay()
      d.delay(0.3) {
         self.presentViewController(home, animated: false, completion: nil)

      }
      
      
      /*
      
      let header: BoldHeader = home.header
      header.alpha = 0.0
      self.view.addSubview(header)
      
      var homeStandardViews: HomeWelcomeViews = HomeWelcomeViews(controller: home)
      let messages = homeStandardViews.createMessages()
      let buttons = homeStandardViews.createButtons(controllerView: self.view, controller: home)
      for message in messages {
         self.view.addSubview(message)
      }
      for button in buttons {
         self.view.addSubview(button)
      }
      homeStandardViews.show(homeStandardViews.views)
      UIView.animateWithDuration(0.3, animations: {
         header.alpha = 1.0
         }, completion: nil)
      
      */
      
   }
   
   private func animate() {
      
      // Hide the sign in sign up button
      self.signButton.userInteractionEnabled = false
      UIView.animateWithDuration(0.3, animations: {
         self.signButton.alpha = 0.0
      })
      
      let standardView: SignStandardViews = SignStandardViews(controller: self)
      standardView.createToolTip()
      
      // Create the frame for the loading animation and the loading animation
      let frame: Rect = Rect(x: self.width / 2 - 60, y: self.height - 220, w: 120, h: 80)
      let animation: Loading = Loading(frame: frame)
      
      // Add loading animation to view
      self.view.addSubview(animation)
      animation.animation()
      
   }
}

/**
   Extension to add all the views to the page and make Sign conform the View Setup
 */
extension Sign: ViewSetup {
   func setupViews() {
      
      // Set background color
      self.view.backgroundColor = .white
      
      // Create standard views struct and layout views
      let standardViews: SignStandardViews = SignStandardViews(controller: self)
      standardViews.layoutViews()
      
   }
}

