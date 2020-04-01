// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RKPointPin",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "RKPointPin", targets: ["RKPointPin"])
  ],
  targets: [
    .target(name: "RKPointPin", dependencies: []),
    .testTarget(name: "RKPointPinTests", dependencies: ["RKPointPin"])
  ]
)
