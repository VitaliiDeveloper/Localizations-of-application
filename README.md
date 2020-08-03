# Localizations-of-application

You can copy and paste **LocalizationManager** folder to easily using of localization in your application. For more details seeing **Example** folder

# How to use

<b>All configuration files contains inside Localization.swift</b>

<b>For generate keys use script in Build Phases ( it's more comfortable to generate new keys every time on new cleaned build ):
```python

# Required: --input_strings_directory. #It's gonna be your direcetory of .lproj files or localization directorys, anyway script looking for .lproj files in directorys

# Optional: --output_key_path directory/LocalizationKeys.swift # output keys to your file.

# For Example

python3 "$(pwd)/EasyLocalizationAppExample/LocalizationManager/LocalizationsKeyGeneration.py" --input_strings_directory "$(pwd)/EasyLocalizationAppExample/Localizations/" --output_key_path "$(pwd)/EasyLocalizationAppExample/LocalizationManager/LocalizationKeys.swift"
```
</b>

## Feature
- [x] Add script to generate LocalizationKeys
- [x] Manager for loading any localization in Bundle

## Add localization key
### All genereted keys storing in this file <b>LocalizationKeys.swift</b>

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
