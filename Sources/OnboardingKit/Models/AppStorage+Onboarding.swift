//
//  AppStorage+Onboarding.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 6/27/25.
//

import SwiftUI

public extension AppStorage<Bool> {
    /// The key used to store onboarding completion state in UserDefaults.
    ///
    /// This key is used across the app to consistently reference the same
    /// piece of stored data that tracks whether onboarding has been completed.
    static let onboardingKey = "isOnboardingCompleted"

    /// A convenience AppStorage property for tracking onboarding completion.
    ///
    /// This property provides a ready-to-use AppStorage wrapper with:
    /// - Default value: `false` (onboarding not completed)
    /// - Storage key: `onboardingKey`
    /// - Store: `.standard` (UserDefaults.standard)
    static let onboarding = Self(
        wrappedValue: false,
        onboardingKey,
        store: .standard
    )
}
