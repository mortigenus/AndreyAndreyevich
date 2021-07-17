// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "AndreyAndreyevich",
  products: [
    .library(
      name: "AndreyAndreyevich",
      targets: ["AndreyAndreyevich"]),
    .executable(
      name: "markov",
      targets: ["markov"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
    .package(url: "https://github.com/apple/swift-algorithms", from: "0.2.1"),
    .package(url: "https://github.com/apple/swift-collections", from: "0.0.4"),
    .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.9.0"),
  ],
  targets: [
    .target(
      name: "AndreyAndreyevich",
      dependencies: [
        .product(name: "Collections", package: "swift-collections"),
        .product(name: "Algorithms", package: "swift-algorithms"),
      ]),
    .target(
      name: "markov",
      dependencies: [
        "AndreyAndreyevich",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]),
    .testTarget(
      name: "AndreyAndreyevichTests",
      dependencies: [
        "AndreyAndreyevich",
        "SnapshotTesting",
      ],
      exclude: [
        "__Snapshots__",
      ]),
  ]
)

