// swift-tools-version: 6.1
import PackageDescription

let package = Package(
  name: "KTVHTTPCache",
  platforms: [.iOS(.v17), .macOS(.v14)],
  products: [.library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])],
  targets: [
    .target(
      name: "CocoaAsyncSocket",
      path: "Vendors/CocoaAsyncSocket",
      publicHeadersPath: "include",
      cSettings: [.unsafeFlags(["-fobjc-arc"])],
      linkerSettings: [.linkedFramework("Security"), .linkedFramework("CFNetwork")]
    ),
    .target(
      name: "KTVHTTPCache",
      dependencies: ["CocoaAsyncSocket"],
      path: "KTVHTTPCache",
      publicHeadersPath: "include",
      cSettings: [
        .headerSearchPath("."),
        .headerSearchPath("Classes/KTVHCCommon"),
        .headerSearchPath("Classes/KTVHCDataStorage"),
        .headerSearchPath("Classes/KTVHCDownload"),
        .headerSearchPath("Classes/KTVHCHTTPServer"),
        .headerSearchPath("Classes/KTVHCTools"),
        .headerSearchPath("CocoaHTTPServer"),
        .headerSearchPath("CocoaHTTPServer/Categories"),
        .headerSearchPath("CocoaHTTPServer/Mime"),
        .headerSearchPath("CocoaHTTPServer/Responses"),
        .unsafeFlags(["-fobjc-arc"])
      ],
      linkerSettings: [.linkedFramework("UIKit", .when(platforms: [.iOS]))]
    )
  ]
)
