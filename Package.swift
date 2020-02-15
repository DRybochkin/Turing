// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Turing",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "TuringAnyRecursive", targets: ["TuringAnyRecursive"]),

        .library(name: "TuringDIInterface", targets: ["TuringDIInterface"]),
        .library(name: "TuringDI", targets: ["TuringDI"]),

        .library(name: "TuringErrorInterface", targets: ["TuringErrorInterface"]),
        .library(name: "TuringError", targets: ["TuringError"]),

        .library(name: "TuringHttpServiceInterface", targets: ["TuringHttpServiceInterface"]),
        .library(name: "TuringHttpService", targets: ["TuringHttpService"]),

        .library(name: "TuringSafeValue", targets: ["TuringSafeValue"]),

        .library(name: "TuringStorageServiceInterface", targets: ["TuringStorageServiceInterface"]),
        .library(name: "TuringUserDefaultsService", targets: ["TuringUserDefaultsService"]),

        .library(name: "TuringValueInterface", targets: ["TuringValueInterface"]),
        .library(name: "TuringValue", targets: ["TuringValue"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.9.1")
    ],
    targets: [
        .target(
            name: "TuringAnyRecursive",
            dependencies: [],
            path: "Sources/AnyRecursive/TuringAnyRecursive/Classes"),
        .target(
            name: "TuringDIInterface",
            dependencies: [],
            path: "Sources/DI/Interface/TuringDIInterface/Classes"),
        .target(
            name: "TuringDI",
            dependencies: ["TuringDIInterface", "TuringSafeValue"],
            path: "Sources/DI/Implementation/TuringDI/Classes"),
        .target(
            name: "TuringErrorInterface",
            dependencies: [],
            path: "Sources/Error/Interface/TuringErrorInterface/Classes"),
        .target(
            name: "TuringError",
            dependencies: ["TuringErrorInterface"],
            path: "Sources/Error/Implementation/TuringError/Classes"),
        .target(
            name: "TuringHttpServiceInterface",
            dependencies: [],
            path: "Sources/Http/Interface/TuringHttpServiceInterface/Classes"),
        .target(
            name: "TuringHttpService",
            dependencies: ["TuringHttpServiceInterface", "Alamofire", "TuringErrorInterface", "TuringError"],
            path: "Sources/Http/Implementation/TuringHttpService/Classes"),
        .target(
            name: "TuringSafeValue",
            dependencies: [],
            path: "Sources/Safe/Value/TuringSafeValue/Classes"),
        .target(
            name: "TuringStorageServiceInterface",
            dependencies: [],
            path: "Sources/Storage/Interface/TuringStorageServiceInterface/Classes"),
        .target(
            name: "TuringUserDefaultsService",
            dependencies: ["TuringStorageServiceInterface", "TuringErrorInterface", "TuringError"],
            path: "Sources/Storage/Implementation/UserDefaults/TuringUserDefaultsService/Classes"),
        .target(
            name: "TuringValueInterface",
            dependencies: [],
            path: "Sources/Value/Interface/TuringValueInterface/Classes"),
        .target(
            name: "TuringValue",
            dependencies: ["TuringValueInterface"],
            path: "Sources/Value/Implementation/TuringValue/Classes"),

        .testTarget(
            name: "TuringTests",
            dependencies: ["TuringAnyRecursive"]),
    ]
)
