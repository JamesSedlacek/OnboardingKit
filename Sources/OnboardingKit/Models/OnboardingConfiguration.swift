//
//  OnboardingConfiguration.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

/// Configuration model for customizing the onboarding experience.
///
/// `OnboardingConfiguration` provides a centralized way to customize the appearance
/// and content of the onboarding flow. It includes visual styling options, feature
/// content, and layout preferences.
///
/// ## Usage
///
/// ```swift
/// let config = OnboardingConfiguration(
///     accentColor: .blue,
///     appDisplayName: "My App",
///     features: [
///         FeatureInfo(
///             image: Image(systemName: "star.fill"),
///             title: "Amazing Feature",
///             content: "This feature will change your life!"
///         )
///     ],
///     titleSectionAlignment: .center
/// )
/// ```
public struct OnboardingConfiguration {
    /// The primary accent color used throughout the onboarding flow.
    ///
    /// This color is applied to:
    /// - App name text
    /// - Feature icons
    /// - Primary buttons
    /// - Interactive elements
    let accentColor: Color
    
    /// The display name of the app shown in the onboarding title.
    ///
    /// This name appears prominently in the welcome section and should
    /// match your app's marketing name or display name.
    let appDisplayName: String
    
    /// An array of features to highlight during onboarding.
    ///
    /// Each feature is displayed as a separate item with an icon,
    /// title, and description. Features are presented in the order
    /// they appear in this array.
    let features: [FeatureInfo]
    
    /// The horizontal alignment for the title section.
    ///
    /// Controls how the welcome text and app name are aligned:
    /// - `.leading`: Left-aligned (default)
    /// - `.center`: Center-aligned
    /// - `.trailing`: Right-aligned
    let titleSectionAlignment: HorizontalAlignment

    /// Creates a new onboarding configuration.
    ///
    /// - Parameters:
    ///   - accentColor: The primary accent color (defaults to blue)
    ///   - appDisplayName: The display name of the app
    ///   - features: Array of features to showcase
    ///   - titleSectionAlignment: Alignment for the title section (defaults to leading)
    public init(
        accentColor: Color = .blue,
        appDisplayName: String,
        features: [FeatureInfo],
        titleSectionAlignment: HorizontalAlignment = .leading
    ) {
        self.accentColor = accentColor
        self.appDisplayName = appDisplayName
        self.features = features
        self.titleSectionAlignment = titleSectionAlignment
    }
}

@MainActor
public extension OnboardingConfiguration {
    static let mock = Self.init(
        appDisplayName: .init("OnboardingKit"),
        features: [.mock, .mock2, .mock3, .mock4, .mock5, .mock6]
    )
}
