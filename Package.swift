// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Clock",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Clock",
            targets: [
                "Clock",
            ]
        ),
        .library(
            name: "TimeMachine",
            targets: [
                "TimeMachine",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Clock"
        ),
        .target(
            name: "TimeMachine",
            dependencies: [
                "Clock",
            ]
        ),
        .testTarget(
            name: "ClockTests",
            dependencies: [
                "Clock",
                "TimeMachine",
            ]
        ),
    ]
)
