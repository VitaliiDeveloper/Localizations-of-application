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

enum AppLanguagesCode:String {
  case ru_UA
  case en_UK
}

enum AppLanguages:String {
  case ru
  case en
}

enum AppLanguageFiles:String {
  case Localizable
}

class Localization {
  static let main = Localization()
  
  private var bundle:Bundle?
  
  private var _usageAppLanguageCode:AppLanguagesCode = .ru_UA
  var usageAppLanguageCode:AppLanguagesCode {
    return _usageAppLanguageCode
  }
  
  private var _usageAppLanguage:AppLanguages = .ru
  var usageAppLanguage:AppLanguages {
    return _usageAppLanguage
  }
  
  func get(key:LocalizationKeys, file:AppLanguageFiles = .Localizable) -> String {
    if self.getUsingLanguage() != nil {
      return bundle!.localizedString(forKey: key.rawValue, value: nil, table: file.rawValue)
    } else {
      return "Need to set Localization language!"
    }
  }
  
  func set(language:AppLanguages) {
    guard let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj") else {
      assertionFailure("path doesn't available!")
      return
    }
    
    self._usageAppLanguage = language
    
    switch language {
    case .ru:
      self._usageAppLanguageCode = .ru_UA
    case .en:
      self._usageAppLanguageCode = .en_UK
    }
    
    self.bundle = Bundle(path: path)
    UserDefaults.standard.set(language.rawValue, forKey: "application-language")
    UserDefaults.standard.set([self._usageAppLanguageCode.rawValue], forKey: "AppleLanguages")
  }
  
  func getUsingLanguage() -> String? {
    if self.bundle != nil {
      return UserDefaults.standard.string(forKey: "application-language")
    } else {
      return nil
    }
  }
}
