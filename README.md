# DizzyKit
Simple animation library that allows you to easily animate things.

This framework is heavily inspired by [Spruce](https://github.com/willowtreeapps/spruce-ios).
The reason I made this is because I needed a framework to do animations without having to put them in a container view first.

### Usage

```swift
let animations: [AnimationType] = [.fadeIn, .slide(.up, .moderately)]

view.dizzy.prepare(with: animations)
view.dizzy.animate(animations)
```
