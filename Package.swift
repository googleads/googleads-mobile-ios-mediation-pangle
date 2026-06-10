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
      exact: "7.9.1-release.1"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-8.1.0.6.0.zip",
      checksum: "c5e706c603c688041608f47ed1e28a9c7df88c65e38873d5d2f1604a74b856ca"
    ),
  ]
)
