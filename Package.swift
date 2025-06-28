// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnboardingKit",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],
    products: PackageProduct.allCases.map(\.description),
    targets: InternalTarget.allCases.map(\.target)
)

// MARK: PackageProduct

fileprivate enum PackageProduct: CaseIterable {
    case onboardingKit

    var name: String {
        switch self {
        case .onboardingKit: "OnboardingKit"
        }
    }

    var targets: [InternalTarget] {
        switch self {
        case .onboardingKit:
            InternalTarget.allCases
        }
    }

    var description: PackageDescription.Product {
        switch self {
        case .onboardingKit:
            .library(
                name: self.name,
                targets: self.targets.map(\.title)
            )
        }
    }
}

// MARK: InternalTarget

fileprivate enum InternalTarget: CaseIterable {
    case onboardingKit

    var title: String {
        switch self {
        case .onboardingKit: return "OnboardingKit"
        }
    }

    var targetDependency: Target.Dependency {
        .target(name: title)
    }

    var dependencies: [Target.Dependency] {
        []
    }

    var resources: [Resource]? {
        switch self {
        case .onboardingKit:
            [
                .process("Resources/Media.xcassets"),
                .process("Resources/Localizable.xcstrings")
            ]
        }
    }

    var target: Target {
        .target(
            name: self.title,
            dependencies: self.dependencies,
            resources: self.resources
        )
    }
}
