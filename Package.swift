// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let moduleRepoURL = "https://github.com/adison-ads/adison-ofw-module-karrot-ios/releases/download"
let moduleVersion = "0.9.2"
let artifact = "KarrotOfwModule.zip"
let checksum = "0710c63a3ec0b84055a18fa2726df5cad2eb15d0792b424c60ef1b9c363dd88a"

let coreRepoURL = "https://github.com/adison-ads/adison-offerwall-ios-sdk"
let coreVersion = Version("5.1.4")

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
