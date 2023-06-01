// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomUIKitItems",
    platforms: [.iOS(.v13)],
    products: [.library(name: "CustomUIKitItems", targets: ["CustomUIKitItems"])],
    targets: [.target(name: "CustomUIKitItems", path: "Sources")]
)
