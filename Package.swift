// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let moduleRepoURL = "https://github.com/adison-ads/adison-ofw-module-karrot-ios/releases/download"
let moduleVersion = "0.9.0"
let artifact = "KarrotOfwModule.zip"
let checksum = ""

let coreRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let coreVersion = Version("5.1.0")

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
