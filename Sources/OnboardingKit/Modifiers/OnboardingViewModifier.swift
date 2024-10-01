//
//  OnboardingViewModifier.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import SwiftUI

struct OnboardingViewModifier: ViewModifier {
    @State private var onboardingProvider: OnboardingProvider

    init(storage: UserDefaults = .standard, config: OnboardingConfiguration) {
        _onboardingProvider = .init(initialValue: OnboardingProvider(storage: storage, configuration: config))
    }

    func body(content: Content) -> some View {
        Group {
            if onboardingProvider.isShowingOnboarding {
                OnboardingView()
            } else {
                content
            }
        }
        .environment(onboardingProvider)
    }
}
