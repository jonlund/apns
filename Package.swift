// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "apnsvapor",
    platforms: [
       .macOS(.v10_15),
	   .iOS(.v16),
    ],
    products: [
        .library(name: "APNSVapor", targets: ["APNSVapor"]),
    ],
    dependencies: [
        //.package(name: "apnswift", url: "https://github.com/kylebrowning/APNSwift.git", from: "3.0.0"),
		//.package(name: "apnswift", url: "https://github.com/mackoj/APNSwift.git", .branch("patch-1")),
		.package(name: "apnswift", url: "https://github.com/jonlund/APNSwift.git", branch: "main"),
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(name: "APNSVapor", dependencies: [
            .product(name: "APNSwift", package: "apnswift"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "APNSTests", dependencies: [
            .target(name: "APNSVapor"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
