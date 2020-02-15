// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Turing",
    products: [
        .library(name: "AnyRecurcive", targets: ["AnyRecurcive"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AnyRecurcive",
                dependencies: [],
                path: "AnyRecurcive/TuringAnyRecursive/Classes"),
        .testTarget(name: "TuringTests", dependencies: ["Turing"]),
    ]
)
