# DizzyKit [![Build Status](https://travis-ci.org/bjarkehs/DizzyKit.svg?branch=master)](https://travis-ci.org/bjarkehs/DizzyKit)

Simple animation library that allows you to easily animate things.

This framework is heavily inspired by [Spruce](https://github.com/willowtreeapps/spruce-ios).
The reason I made this is because I needed a framework to do animations without having to put them in a container view first.

The framework attempts to be compatible with latest version of Swift.
Please check the Swift version matrix to see which version supports your Swift version.
The last verified version of Swift is 4.2 but it may still compile on later versions.

## Installation

### Swift version matrix

Below is a table that shows which version of DizzyKit you should use for
your Swift version.

| Swift | DizzyKit |
| ----- | -------- |
| 4.X   | 2.X      |
| 3.X   | 1.X      |

### CocoaPods

Use the following entry in your Podfile:

```rb
pod 'DizzyKit', '~> 2.0'
```

Then run `pod install`.

### Carthage

Add the following to your Cartfile:

```sh
github "bjarkehs/DizzyKit" ~> 2.0
```

Then run `carthage update`.

## Usage

```swift
let animations: [AnimationType] = [.fadeIn, .slide(.up, .moderately)]

view.dizzy.prepare(with: animations)
view.dizzy.animate(animations)
```
