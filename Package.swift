// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnboardingKit",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "OnboardingKit",
            targets: ["OnboardingKit"]),
    ],
    targets: [
        .target(
            name: "OnboardingKit"),
        .testTarget(
            name: "OnboardingKitTests",
            dependencies: ["OnboardingKit"]),
    ]
)
