//
//  RealmAccount.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/2/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation

/**
    This struct is used to create the account and store it in the keychain
 */
struct Account {
   /// The auth token from digits
   let uID: String
   /// The phone number from digits
   let number: String
   /// The keychain access
   private var keychain: Keychain
   
    
   /// Default initalizer if going to store value
   init(id: String, number: String) {
        
      self.uID = id
      self.number = number
      self.keychain = Keychain(service: "Htlaeh.Htlaeh")
        
   }
   
   /// Default initalizer if going to get value
   init() {
      
      self.number = "0"
      self.uID = "nil"
      self.keychain = Keychain(service: "Htlaeh.Htlaeh")
      
   }
    
   /** This method is used to store the information in the keycahin
    - returns: Returns false if an error occured and nil if everything was success
   */
   func store() -> Bool? {
      // Store the phone number
      do {
         try keychain.set("\(self.number)", key: "phoneNumber")
      } catch let error as NSError {
         print("error: \(error.localizedDescription)")
         return false
      }
      // Store the uid
      do {
         try keychain.set("\(self.uID)", key: "uid")
      } catch let error as NSError {
         print("error: \(error.localizedDescription)")
         return false
      }
      return nil
   }
    
    /// This method is used to get the information from the keychain
   func get() -> Account? {
      // The tuple that will be returned
      var account: (phoneNumber: String?, uid: String?)
      // Try and get the phone number if its not there then print the error
      do {
         let number = try keychain.get("phoneNumber")
         account.phoneNumber = number
      } catch let error as NSError {
         print("error: \(error.localizedDescription)")
         return nil
      }
      // Try and get the user id if it's not there then print the error
      do {
         let uid = try keychain.get("uid")
         account.uid = uid
      } catch let error as NSError {
         print("Error: \(error.localizedDescription)")
         return nil
      }
      // Make sure both values aren't nil in account
      guard account.phoneNumber != nil else { return nil }
      guard account.uid != nil else { return nil }
      // Return the value
      let acc = Account(id: account.uid!, number: account.phoneNumber!)
      return acc
      
   }
   
}