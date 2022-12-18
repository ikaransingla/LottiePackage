// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LottiePackage",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LottiePackage",
            targets: ["LottiePackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.0.1"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "LottiePackageTest", path: "Sources/LottiePackageTest.xcframework"),
        .target(
            name: "LottiePackage",
            dependencies: [
                .target(name: "LottiePackageTest", condition: .when(platforms: [.iOS])),
                .product(name: "Lottie", package: "lottie-ios"),
            ])
    ]
)
