# RKPointPin

RKPointPin is a UIView which sticks to an `ARView` and points at a chosen entity within the scene, with options to hide the pin when near the center of the screen, or perform any custom actions.

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-v1.0.0-orange.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![Swift 5.2](https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat)](https://swift.org/)

![RKPointPin Example](media/pin_512.gif)

## Minimum Requirements
- Swift 5.2
- iOS 13.0 (RealityKit)
- Xcode 11.4

### Swift Package Manager

Add the URL of this repository to your Xcode 11+ Project.

`https://github.com/maxxfrazer/RKPointPin.git`


## Usage

See the [Example](./RKPointPin+Example) for a full working example as can be seen in the GIF above

Once you create your `RKPointPin`, add it to your ARView, and then choose your target `Entity`.

Doing so may look similar to this:
```swift
let rkPin = RKPointPin()
self.arView.addSubview(rkPin)
rkPin.targetEntity = boxEntity
```

By default the RKPointPin will be visible all the time, but if you want the pin to hide when in the center, set the `focusPercentage` to a value ranging from 0 to 1. If  `focusPercentage` is set to 1, then the pin will only appear when the `targetEntity` is outside of the view, as everything from the edges inwards is considered the focus area.
