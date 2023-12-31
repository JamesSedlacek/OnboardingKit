//
//  OnboardingView.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(OnboardingProvider.self)
    private var onboardingProvider
    @State private var isAnimating = false

    var body: some View {
        VScrollView {
            VStack(alignment: .center, spacing: 40) {
                TitleSection(shouldHideAppIcon: !isAnimating)
                    .offset(y: isAnimating ? 0 : 200)
                FeatureSection(features: onboardingProvider.configuration.features,
                               accentColor: onboardingProvider.configuration.accentColor)
                .opacity(isAnimating ? 1 : 0)
                .padding(.horizontal, 48)
            }
            .padding(.vertical, 24)
        }
        .background(Color.secondaryBackground)
        .safeAreaInset(edge: .bottom) {
            BottomSection()
                .opacity(isAnimating ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8).delay(1.6)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environment(OnboardingProvider.mock)
}
