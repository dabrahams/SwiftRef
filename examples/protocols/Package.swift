// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ExamplesProtocolConformance",
  products: [],
  dependencies: [],
  targets: [
    .testTarget(name: "TestA"),
    .testTarget(name: "TestB"),
    .testTarget(name: "TestC"),
  ]
)
