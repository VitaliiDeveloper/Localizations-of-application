//
//  Localization.swift
//
//  Created by Vitalii Lavreniuk on 4/1/19.
//  Copyright © 2019 Vitalii Lavreniuk. All rights reserved.
//

#if os(OSX)
import Cocoa
#elseif os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

enum AppLanguages:String {
  case en
}

enum AppLanguageFiles:String {
  case Localization
}

class Localization {
  private static var bundle:Bundle?
  
  static func get(key:LocalizationKeys, file:AppLanguageFiles = .Localization) -> String {
    if Localization.getUsingLanguage() != nil {
      return bundle!.localizedString(forKey: key.rawValue, value: nil, table: file.rawValue)
    } else {
      return "Need to set Localization language!"
    }
  }
  
  static func set(language:AppLanguages) {
    guard let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj") else {
      assertionFailure("path doesn't available!")
      return
    }
    
    self.bundle = Bundle(path: path)
    UserDefaults.standard.set("en", forKey: "application-language")
  }
  
  static func getUsingLanguage() -> String? {
    if self.bundle != nil {
      return UserDefaults.standard.string(forKey: "application-language")
    } else {
      return nil
    }
  }
}
