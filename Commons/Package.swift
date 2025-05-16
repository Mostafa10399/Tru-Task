// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Commons",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Commons",
            targets: ["Commons"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.3.2")
    ],
    targets: [
        .target(
            name: "Commons",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            resources: [
                    .process("Cells/ProductCell/ProductCell.xib"),
                    .process("Cells/ProductCollectionCell/ProductCollectionCell.xib")
                ]
        ),
    ]
)
