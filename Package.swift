// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "DizzyKit",
    platforms: [
      .iOS(.v10)
    ],
    products: [
        .library(name: "DizzyKit", targets: ["DizzyKit"])
    ],
    targets: [
         .target(
            name: "DizzyKit",
            dependencies: [],
            path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)

let version = Version(2, 0, 1)
