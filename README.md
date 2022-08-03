![LOGO](https://github.com/fanta1ty/TCheckBox/blob/master/ScreenShot/Logo.png)

# TCheckBox

TCheckBox is developed to help you display check boxes and content in the fastest way without spending many lines of code
  
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen)](https://developer.apple.com/swift/)
[![Version](https://img.shields.io/cocoapods/v/TCheckBox.svg?style=flat)](https://cocoapods.org/pods/TCheckBox)
[![License](https://img.shields.io/cocoapods/l/TCheckBox.svg?style=flat)](https://cocoapods.org/pods/TCheckBox)
[![Platform](https://img.shields.io/cocoapods/p/TCheckBox.svg?style=flat)](https://cocoapods.org/pods/TCheckBox)
[![Email](https://img.shields.io/badge/contact-@thinhnguyen12389@gmail.com-blue)](thinhnguyen12389@gmail.com)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TCheckBox is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TCheckBox'
```

## Usage
```swift
import TCheckBox
```

1) Initiate ``TCheckBox``
```swift
let checkBox = TCheckBox()
```

2) Input content you want to show into ``TCheckBox`` property
```swift
checkBox.contentLabel.text = "Hello TCheckBox...."
```

3) Toggle ``isSelected`` property for checked/unchecked
```swift
checkBox.checkButton.isSelected = true
checkBox.checkButton.isSelected = false
```

![til](https://github.com/fanta1ty/TCheckBox/blob/master/ScreenShot/Screen%20Shot.gif)

## Requirements
- iOS 10.0 or later
- Swift 5.0 or later

## Author

fanta1ty, thinhnguyen12389@gmail.com

## License

TCheckBox is available under the MIT license. See the LICENSE file for more info.
