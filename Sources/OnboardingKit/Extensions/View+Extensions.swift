//
//  View+Extensions.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

public extension View {
    /// This function checks if onboarding is needed and shows it if necessary.
    /// - Parameters:
    ///   - storage: The UserDefaults storage to use. Defaults to .standard.
    ///   - config: The configuration for the onboarding.
    /// - Returns: The original view, modified with the onboarding view modifier.
    func showOnboardingIfNeeded(
        storage: UserDefaults = .standard,
        using config: OnboardingConfiguration
    ) -> some View {
        modifier(OnboardingViewModifier(storage: storage, config: config))
    }
}

#Preview {
    Text("Hello, World!")
        .showOnboardingIfNeeded(using: .mock)
}
