// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AzureBlobCLI",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/oliwonders/AzureStorageSwift.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AzureBlobCLI",
            dependencies: ["AzureStorageSwift", "AzureBlobLister"]
        ),
        .target(
            name: "AzureBlobLister",
            dependencies: ["AzureStorageSwift"]
        )
    ]
)
