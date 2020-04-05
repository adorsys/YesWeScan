// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YesWeScan",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "YesWeScan",
            targets: ["YesWeScan"]),
    ],
    targets: [
        .target(
            name: "YesWeScan",
            dependencies: [])
    ],
    swiftLanguageVersions: [.v5]
)
