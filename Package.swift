// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftTelegramBotAPI",
    products: [
        .library(name: "SwiftTelegramBotAPI", targets: ["SwiftTelegramBotAPI"])
    ],
    dependencies: [
        .package(url: "https://github.com/antitypical/Result.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "SwiftTelegramBotAPI", dependencies: ["Result"])
    ]
)
