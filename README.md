# RxPersistenceSettings

[![CI Status](http://img.shields.io/travis/3ph/RxPersistenceSettings.svg?style=flat)](https://travis-ci.org/3ph/RxPersistenceSettings)
[![Version](https://img.shields.io/cocoapods/v/RxPersistenceSettings.svg?style=flat)](http://cocoapods.org/pods/RxPersistenceSettings)
[![License](https://img.shields.io/cocoapods/l/RxPersistenceSettings.svg?style=flat)](http://cocoapods.org/pods/RxPersistenceSettings)
[![Platform](https://img.shields.io/cocoapods/p/RxPersistenceSettings.svg?style=flat)](http://cocoapods.org/pods/RxPersistenceSettings)

The goal of this library is to provide generic protocol for basic operations with any persisted setting regardless of persistence store used. You can also add some metadata to the setting (like name and description).

Currently implemented for `UserDefaults` only but can be simply extended.

## Protocols

#### `PersistenceSettingBase`
This is the base protocol which can be adopted without knowing the underlaying value type. Useful for generic UI to show the current formatted value, metadata and ability to trigger increase/decrease of the underlaying value. Changes in (formatted) value can also be observed.

```swift
/// Title of the setting.
var titleString: String { get }

/// Detailed info for the setting.
var infoString: String { get }

/// Formatted value to be shown in the UI.
var formattedValueString: String { get }

/// Determines if setting is of numerical value (rather than set of distinct values).
var isNumeric: Bool { get }

/// Determine if value is minimal allowed value.
var isAtMin: Bool { get }

/// Determine if value is maximal allowed value.
var isAtMax: Bool { get }

/// Increase the value.
func increase()

/// Increase the value.
func decrease()

/// Observable of formatted value change.
var formattedValueChanged: Observable<String> { get }
```

#### `PersistenceSetting`
Inherits from `PersistenceSettingBase`. Value (and also default value) is directly accessible and changes observable.

```swift
associatedtype T

/// Default value in case ther is no current value.
var defaultValue: T { get }

/// Current value for the setting.
var value: T { get set }

/// Observable of value changed.
var valueChanged: Observable<T> { get }

/// Format value and return as String
///
/// - Parameter value: Value to be formatted
/// - Returns: Formatted value as String
func format(value: T) -> String
```

#### `PersistenceSettingFlag`
Specialized `PersistenceSetting` with base type `Bool`. Adds `isSet` property and also `toggle` function for easier flag manipulation.

```swift
/// Get/set current flag value
var isSet: Bool { get set }

/// Toggle the current flag
func toggle()
```

### `UserDefaults` implementation
The above protocols were implemented for `UserDefaults`.

#### `UserDefaultsSettingBase`
Adds `key` property for the corresponding `UserDefaults` key.

```swift
/// Key in user defaults for this persisted value.
var key: String { get }
```

#### `UserDefaultsSetting`
Class implements `UserDefaultsSettingBase` and add 2 initializers - one with metadata and one without.

```swift
/// Simplified initializer without setting metadata.
///
/// - Parameters:
///   - key: UserDefaults key
///   - defaultValue: Default value if no value is present
public init(key: String, defaultValue: T)

/// Full initializer with metadata.
///
/// - Parameters:
///   - titleString: Title string for the setting
///   - infoString: Info string for the setting
///   - key: UserDefaults key
///   - defaultValue: Default value if no value is present
public init(titleString: String, infoString: String, key: String, defaultValue: T)
```

#### `NumericUserDefaultsSetting`
Convenience class for numeric settings. Uses `step` property to figure out increase/decrease of value.

```swift
/// Increase/decrease step for the setting's value.
public var step: Type


/// Simplified initializer without setting metadata.
///
/// - Parameters:
///   - key: UserDefaults key
///   - defaultValue: Default value if no value is present
///   - min: Minimal allowed value
///   - max: Maximal allowed value
///   - step: Increase/decrease step for the setting's value
public init(key: String, defaultValue: Type, min: Type, max: Type, step: Type)

/// Full initializer with metadata.
///
/// - Parameters:
///   - titleString: Title string for the setting
///   - infoString: Info string for the setting
///   - key: UserDefaults key
///   - defaultValue: Default value if no value is present
///   - min: Minimal allowed value
///   - max: Maximal allowed value
///   - step: Increase/decrease step for the setting's value
public init(titleString: String, infoString: String, key: String, defaultValue: Type, min: Type, max: Type, step: Type)
```
## Usage
You can either use defined `UserDefaults` ones or create your own.

### Simple `UserDefaults` setting
```swift
let simpleSetting = UserDefaultsSetting<Int>(key: "simpleIntSettingKey", defaultValue: 10)
// Access value directly, increase/decrease not implemented for simple setting.
simpleSetting.value = 12
```
### Numeric `UserDefaults` setting
```swift
let numericSetting = NumericUserDefaultsSetting<Int>(
    titleString: "Number of cats",
    infoString: "This setting holds number of cats",
    key: "complexIntSettingKey",
    defaultValue: 1,
    min: 0,
    max: 13,
    step: 1))
    
numericSetting.increase()
// value = 2

numericSetting.increase()
// value = 3

numericSetting.value = 13
// value = 13
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8+. RxSwift/Cocoa.

## Installation

RxPersistenceSettings is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxPersistenceSettings'
```

## Author
Tomas Friml, instantni.med@gmail.com

## License

RxPersistenceSettings is available under the MIT license. See the LICENSE file for more info.
