// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let moduleRepoURL = "https://github.com/adison-ads/adison-ofw-module-karrot-ios/releases/download"
let moduleVersion = "0.9.0"
let artifact = "KarrotOfwModule.zip"
let checksum = "6dea305ff8c2729c39e6f29c423f5259a4cbbf3207ef4a3307fbc6ef5fbc492e"

let coreRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let coreVersion = Version("5.1.2")

// MARK: - Do not change.
let package = Package(
    name: "KarrotOfwModule",
    products: [
        .library(
            name: "KarrotOfwModule",
            targets: ["KarrotOfwModule", "_KarrotOfwModule"]
        )
    ],
    dependencies: [
        .package(
            url: coreRepoURL,
            exact: coreVersion
        )
    ],
    targets: [
        .binaryTarget(
            name: "KarrotOfwModule",
            url: moduleRepoURL + "/" + moduleVersion + "/" + artifact,
            checksum: checksum
        ),
        .target(
            name: "_KarrotOfwModule",
            dependencies: [
                .product(name: "AdisonOfferwallSDK", package: "adison-offerwall-ios-sdk")
            ],
            path: "Sources"
        ),
    ]
)
