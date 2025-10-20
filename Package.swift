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
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "PangleAdapterTarget",
      targets: ["PangleAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/bytedance/AdsGlobalPackage.git",
      exact: "7.6.0-release.6"
    )
  ],
  targets: [
    .target(
      name: "PangleAdapterTarget",
      dependencies: [
        .target(name: "PangleAdapter"),
        .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage")
      ],
      path: "PangleAdapterTarget"
    ),
    .binaryTarget(
      name: "PangleAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-7.6.0.6.0.zip",
      checksum: "3f7248d2582b75cc1856d8b824c55d51c154ac326a6f5d0ac4969c07869fd1d8"
    ),
  ]
)
