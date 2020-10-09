# DizzyKit [![Build Status](https://travis-ci.org/bjarkehs/DizzyKit.svg?branch=master)](https://travis-ci.org/bjarkehs/DizzyKit) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DizzyKit.svg)](https://img.shields.io/cocoapods/v/DizzyKit.svg) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Simple animation library that allows you to easily animate things.

This framework is heavily inspired by [Spruce](https://github.com/willowtreeapps/spruce-ios).
The reason I made this is because I needed a framework to do animations without having to put them in a container view first.

The framework attempts to be compatible with latest version of Swift.
Please check the Swift version matrix to see which version supports your Swift version.
The last verified version of Swift is 5.3 but it may still compile on later versions.
The lowest version of iOS supported is 10.

## Installation

### Swift version matrix

Below is a table that shows which version of DizzyKit you should use for
your Swift version.

| Swift | DizzyKit |
| ----- | -------- |
| 5.X   | 3.X      |
| 4.X   | 2.X      |
| 3.X   | 1.X      |

### CocoaPods

Use the following entry in your Podfile:

```rb
pod 'DizzyKit', '~> 3.0'
```

Then run `pod install`.

### Carthage

Add the following to your Cartfile:

```sh
github "bjarkehs/DizzyKit" ~> 3.0
```

Then run `carthage update`.

### Swift Package Manager

To install DizzyKit without Xcode UI, add the following to your `Package.swift`:

```swift
.package(url: "https://github.com/bjarkehs/DizzyKit.git", .upToNextMajor(from: "3.0.0"))
```

## Usage

```swift
let animations: [AnimationType] = [.fadeIn, .slide(.up, .moderately)]

view.dizzy.prepare(with: animations)
view.dizzy.animate(animations)
```
