// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "StencilSwiftKit",
  products: [
    .library(name: "StencilSwiftKit", targets: ["StencilSwiftKit"])
  ],
  dependencies: [
    .package(url: "https://github.com/shibapm/Komondor.git", exact: "1.1.3"),
    .package(url: "https://github.com/art-divin/Stencil.git", exact: "0.15.3")
  ],
  targets: [
    .target(name: "StencilSwiftKit", dependencies: [
      "Stencil"
    ]),
    .testTarget(name: "StencilSwiftKitTests", dependencies: [
      "StencilSwiftKit"
    ])
  ],
  swiftLanguageVersions: [.v5]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration([
  "komondor": [
    "pre-commit": [
        "PATH=\"~/.rbenv/shims:$PATH\" bundler exec rake lint:code",
        "PATH=\"~/.rbenv/shims:$PATH\" bundler exec rake lint:tests"
    ],
    "pre-push": [
      "PATH=\"~/.rbenv/shims:$PATH\" bundle exec rake spm:test"
    ]
  ],
]).write()
#endif
