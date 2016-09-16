//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
   enum AssetIdentifier: String {
      
      case Account = "Account"
      case Add = "Add"
      case Back = "Back"
      case Check = "Check"
      case ChevronBack = "ChevronBack"
      case ChevronForward = "ChevronForward"
      case Close = "Close"
      case Cloud = "Cloud"
      case DateRange = "DateRange"
      case Devices = "Devices"
      case Edit = "Edit"
      case Filter = "Filter"
      case Free = "Free"
      case Home = "Home"
      case Logo = "Logo"
      case LogoSmooth = "LogoSmooth"
      case Menu = "Menu"
      case More = "More"
      case Remove = "Remove"
      case Reorder = "Reorder"
      case Search = "Search"
      case Settings = "Settings"
      case Today = "Today"
      case WordLogo = "WordLogo"
      
   }
   
   convenience init!(assetIdentifier: AssetIdentifier) {
      self.init(named: assetIdentifier.rawValue)
   }
}


struct Images {
   
   struct Action {
      
      let account: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Account)
      let date: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.DateRange)
      let home: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Home)
      let reorder: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Reorder)
      let search: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Search)
      let settings: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Settings)
      let today: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Today)
      
   }
   
   struct Content {
      
      let add: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Add)
      let filter: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Filter)
      static let remove: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Remove)
      
   }
   
   struct Editor {
      
      let free: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Free)
      let edit: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Edit)
      
   }
   
   struct File {
      
      let cloud: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Cloud)
      
   }
   
   struct Hardware {
      
      let devices: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Devices)
      
   }
   
   struct Htlaeh {
      
      let logo: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Logo)
      let logoSmooth: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.LogoSmooth)
      let wordLogo: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.WordLogo)
      
   }
   
   struct Navigation {
      
      let back: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Back)
      let check: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Check)
      let chevronBack: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.ChevronBack)
      let chevronForward: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.ChevronForward)
      let close: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Close)
      let menu: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Menu)
      let more: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.More)
      
   }
}