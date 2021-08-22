// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "EmojiManiaScenes",
    platforms: [
        .macOS(.v10_15), .iOS(.v14)
    ],
    products: [
        .library(
            name: "EmojiManiaScenes",
            targets: ["EmojiManiaScenes"]),
    ],
    targets: [
        .target(
            name: "EmojiManiaScenes",
            dependencies: []),
    ]
)
