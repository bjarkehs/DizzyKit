# DizzyKit
Simple animation library that allows you to easily animate things

### Usage

```swift
let animations: [AnimationType] = [.fadeIn, .slide(.up, .moderately)]

view.dizzy.prepare(with: animations)
view.dizzy.animate(animations)
```
