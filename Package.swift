// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "miniapp-uikit-sdk",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "miniapp-uikit-sdk",
            targets: ["miniapp-uikit-sdk", "miniapp_uikit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/stanydsouza/miniapp-core-sdk.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "miniapp-uikit-sdk",
            dependencies: [
                .product(name: "miniapp-core-sdk", package: "miniapp-core-sdk")
            ]
        ),
        .binaryTarget(
            name: "miniapp_uikit",
            path: "./Sources/miniapp_uikit.xcframework"
        )
    ]
)
