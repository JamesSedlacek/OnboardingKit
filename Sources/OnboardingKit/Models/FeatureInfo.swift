//
//  FeatureInfo.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

/// A model representing a single feature to be displayed in the onboarding flow.
///
/// `FeatureInfo` encapsulates the visual and textual information needed to present
/// a feature highlight during onboarding. Each feature consists of an icon, title,
/// and descriptive content.
///
/// ## Usage
///
/// ```swift
/// let feature = FeatureInfo(
///     image: Image(systemName: "heart.fill"),
///     title: "Health Tracking",
///     content: "Monitor your daily activity and health metrics with ease."
/// )
/// ```
public struct FeatureInfo: Identifiable {
    /// A unique identifier for the feature.
    ///
    /// Automatically generated UUID that conforms to the `Identifiable` protocol,
    /// allowing `FeatureInfo` instances to be used in SwiftUI `ForEach` loops.
    public let id: UUID = .init()

    /// The icon or image representing the feature.
    ///
    /// Typically uses SF Symbols or custom images to visually represent
    /// the feature being highlighted.
    let image: Image

    /// The title or name of the feature.
    ///
    /// A concise, descriptive title that identifies the feature.
    /// Should be brief and easily scannable.
    let title: String

    /// A detailed description of the feature.
    ///
    /// Provides additional context about what the feature does
    /// and how it benefits the user.
    let content: String

    /// Creates a new feature info instance.
    ///
    /// - Parameters:
    ///   - image: The icon or image representing the feature
    ///   - title: The title or name of the feature
    ///   - content: A detailed description of the feature
    public init(
        image: Image,
        title: String,
        content: String
    ) {
        self.image = image
        self.title = title
        self.content = content
    }
}

@MainActor
public extension FeatureInfo {
    /// Mock feature representing cross-platform support.
    static let mock: FeatureInfo = .init(
        image: Image(systemName: "laptopcomputer.and.iphone"),
        title: "Cross-platform Support",
        content: "Works seamlessly on iOS, iPadOS, & macOS."
    )

    /// Mock feature representing multi-language support.
    static let mock2: FeatureInfo = .init(
        image: Image(systemName: "globe"),
        title: "Multi-language Support",
        content: "Built-in localization for 10+ languages."
    )

    /// Mock feature representing Swift 6.0 compatibility.
    static let mock3: FeatureInfo = .init(
        image: Image(systemName: "swift"),
        title: "Swift 6.0 Compatible",
        content: "Built with the latest Swift standards."
    )

    /// Mock feature representing accessibility features.
    static let mock4: FeatureInfo = .init(
        image: Image(systemName: "accessibility"),
        title: "Accessibility First",
        content: "Full Dynamic Type and accessibility support."
    )

    /// Mock feature representing easy customization.
    static let mock5: FeatureInfo = .init(
        image: Image(systemName: "paintbrush.fill"),
        title: "Highly Customizable",
        content: "Flexible options to match your app's design."
    )

    /// Mock feature representing light and dark mode support.
    static let mock6: FeatureInfo = .init(
        image: Image(systemName: "circle.lefthalf.filled"),
        title: "Light & Dark Mode",
        content: "Looks beautiful in both light and dark appearances."
    )
}
