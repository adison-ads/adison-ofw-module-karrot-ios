// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let moduleRepoURL = "https://github.com/adison-ads/adison-ofw-module-karrot-ios/releases/download"
let moduleVersion = "0.9.6"
let artifact = "KarrotOfwModule.zip"
let checksum = "132d951d23811b7fcf88d4dc28bcf9f3954d22cae90ceb16b36c634aba812e80"

let coreRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let coreVersion = Version("5.1.8")

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
