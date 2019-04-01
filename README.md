# Localizations-of-application
You can copy and paste this folder to easily using of localization in your application
# How to use
<b>All configuration files contains inside Localization.swift</b>

## Feature
- [ ] Add script to generate LocalizationKeys

## Add localization key
Use <b>LocalizationKeys.swift</b> file to add new key of your localizations
```swift
enum LocalizationKeys:String {
    case errorPasswordEnter
}
```
## Set new languages as default
```swift
Localization.set(language: .en)
```
## Setup list of languages
Find enum AppLanguages and there you can setup list of your languages

```swift
enum AppLanguages:String {
  case en
}
```

## Different files of localizations
If you have different files for localization application use 
```swift
Localization.get(key: .yourKey, file: setYourFile)
```

## Setup list of files of localizations
```swift
enum AppLanguageFiles:String {
  case Localization
}
```
