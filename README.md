### Swift Package Manager.
```swift
import PackageDescription

let package = Package(
    name: "MyServer",
    dependencies: [
        .package(url: "https://github.com/tomieq/SwiftExtensions", .upToNextMajor(from: "1.0.0"))
    ]
)
```
in the target:
```swift
    targets: [
        .executableTarget(
            name: "AppName",
            dependencies: [
                .product(name: "SwiftExtensions", package: "SwiftExtensions")
            ])
    ]
```
