// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "DizzyKit",
    platforms: [
      .iOS(.v8)
    ],
    products: [
        .library(name: "DizzyKit", targets: ["DizzyKit"])
    ],
    targets: [
         .target(
            name: "DizzyKit",
            dependencies: [])
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)

let version = Version(2, 0, 1)
