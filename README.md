# Localizations-of-application

You can copy and paste the **LocalizationManager** folder to easily using localization in your application. For more details seeing **Example** folder.

## But of course you can use iString for easy CRUD manipulation with application localizations

# How to use

<b>All configuration files contains inside Localization.swift</b>

<b>For generate keys use the script in Build Phases ( it's more comfortable to generate new keys every time on new cleaned build ):
```python

# Required: --input_strings_directory. #It's gonna be your directory of .lproj files or localization directories, anyway script looking for .lproj files in directories

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
