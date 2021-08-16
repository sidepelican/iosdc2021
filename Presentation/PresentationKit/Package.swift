// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PresentationKit",
    platforms: [
        .macOS(.v10_15), .iOS(.v14)
    ],
    products: [
        .library(
            name: "PresentationKit",
            targets: ["PresentationKit"]
        ),
    ],
    targets: [
        .target(
            name: "PresentationKit",
            dependencies: []
        ),
    ]
)
