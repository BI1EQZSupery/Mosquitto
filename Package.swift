// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mosquitto",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Mosquitto",
            targets: ["Mosquitto"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .systemLibrary(name: "cmosquitto",
          pkgConfig: "libmosquitto",
          providers:[
            .brew(["mosquitto"]),
            .apt(["libmosquitto-dev"])
          ]
        ),
        .target(
            name: "Mosquitto",
            dependencies: ["cmosquitto"]),
        .testTarget(
            name: "MosquittoTests",
            dependencies: ["Mosquitto"]),
    ]
)
