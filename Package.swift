// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BaseValueDecodable",
    platforms: [.macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "BaseValueDecodable", targets: ["BaseValueDecodable"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "BaseValueDecodable", dependencies: []),
        .testTarget( name: "BaseValueDecodableTests", dependencies: ["BaseValueDecodable"]),
    ],
    swiftLanguageVersions: [.v5]
)
