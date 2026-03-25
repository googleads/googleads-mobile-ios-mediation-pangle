// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "PangleAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "PangleAdapterTarget",
      targets: ["PangleAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/bytedance/AdsGlobalPackage.git",
      exact: "7.9.0-release.8"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    ),
  ],
  targets: [
    .target(
      name: "PangleAdapterTarget",
      dependencies: [
        .target(name: "PangleAdapter"),
        .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "PangleAdapterTarget"
    ),
    .binaryTarget(
      name: "PangleAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-7.9.0.8.0.zip",
      checksum: "4a18c3727955d3088b9d0afdb9744e0c82258e46d0aea721ecb2684f588d519b"
    ),
  ]
)
