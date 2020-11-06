// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppStoreAPIKeyer",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.3.1"),
    ],
    targets: [
        .target(
            name: "AppStoreAPIKeyer",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "AppStoreAPIKeyerTests",
            dependencies: ["AppStoreAPIKeyer"]),
    ]
)
