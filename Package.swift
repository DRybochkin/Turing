// swift-tools-version:5.1

import PackageDescription

let package = Package(

    // MARK: - Settings

    name: "Turing",
    platforms: [.iOS(.v9)],

    // MARK: - Products

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

    // MARK: - Dependencies

    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.9.1"),
        // По непонятным причинам иногда добавление библиотек приводит к падению xcode и требуется удалять весь кеш
        .package(url: "https://github.com/Quick/Quick.git", .branch("master")),
        .package(url: "https://github.com/Quick/Nimble.git", .branch("master"))
    ],

    // MARK: - Targets

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

        // MARK: - Tests

        .testTarget(
            name: "TuringAnyRecursiveTests",
            dependencies: ["TuringAnyRecursive", "Quick", "Nimble"],
            path: "Sources",
            sources: ["AnyRecursive/Example/Tests"]),
        .testTarget(
            name: "TuringSafeValueTests",
            dependencies: ["TuringSafeValue", "Quick", "Nimble"],
            path: "Sources",
            sources: ["Safe/Value/Example/Tests"]),
        .testTarget(
            name: "TuringDITests",
            dependencies: ["TuringDI", "TuringDIInterface", "TuringSafeValue", "Quick", "Nimble"],
            path: "Sources",
            sources: ["DI/Implementation/Example/Tests"]),
        .testTarget(
            name: "TuringErrorTests",
            dependencies: ["TuringError", "TuringErrorInterface", "Quick", "Nimble"],
            path: "Sources",
            sources: ["Error/Implementation/Example/Tests"]),
        .testTarget(
            name: "TuringHttpServiceTests",
            dependencies: ["TuringHttpService", "TuringHttpServiceInterface", "TuringAnyRecursive",
                           "TuringError", "TuringErrorInterface", "Alamofire",
                           "Quick", "Nimble"],
            path: "Sources",
            sources: ["Http/Implementation/Example/Tests"]),
        .testTarget(
            name: "TuringUserDefaultsServiceTests",
            dependencies: ["TuringUserDefaultsService", "TuringStorageServiceInterface",
                           "TuringError", "TuringErrorInterface", 
                           "Quick", "Nimble"],
            path: "Sources",
            sources: ["Storage/Implementation/UserDefaults/Example/Tests"]),
        .testTarget(
            name: "TuringValueTests",
            dependencies: ["TuringValue", "TuringValueInterface", "Quick", "Nimble"],
            path: "Sources",
            sources: ["Value/Implementation/Example/Tests"]),
    ]
)
