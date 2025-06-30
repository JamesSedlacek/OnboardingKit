//
//  WelcomeScreen.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

public struct WelcomeScreen<C: View> {
    private let config: OnboardingConfiguration
    private let appIcon: Image
    private let continueAction: () -> Void
    private let dataPrivacyContent: () -> C
    @State private var isAnimating = false

    public init(
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: @escaping () -> Void,
        @ViewBuilder dataPrivacyContent: @escaping () -> C
    ) {
        self.config = config
        self.appIcon = appIcon
        self.continueAction = continueAction
        self.dataPrivacyContent = dataPrivacyContent
    }

    private func onAppear() {
        // Platform-specific animation timing for better sheet presentation on macOS
        let delay: Double = {
            #if os(macOS)
            return 0.3  // Shorter delay for macOS sheets to avoid conflicts
            #else
            return 1.6  // Keep original timing for iOS/iPadOS
            #endif
        }()
        
        withAnimation(.easeInOut(duration: 0.8).delay(delay)) {
            isAnimating = true
        }
    }
}

@MainActor
extension WelcomeScreen: View {
    public var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 40) {
                titleSection
                featureSection
            }
            .padding(.vertical, 24)
        }
        .defaultScrollAnchor(.center, for: .alignment)
        .scrollBounceBehavior(.basedOnSize)
        .background(.background.secondary)
        .safeAreaInset(edge: .bottom, content: bottomSection)
        .onAppear(perform: onAppear)
        .onDisappear {
            // Reset animation state for proper re-presentation in sheets
            isAnimating = false
        }
        .dynamicTypeSize(.xSmall ... .xxxLarge)
    }

    private var titleSection: some View {
        TitleSection(
            config: config,
            appIcon: appIcon,
            shouldHideAppIcon: !isAnimating
        )
        .offset(y: isAnimating ? 0 : 200)
    }

    private var featureSection: some View {
        FeatureSection(config: config)
            .opacity(isAnimating ? 1 : 0)
            .padding(.horizontal, 48)
    }

    private func bottomSection() -> some View {
        BottomSection(
            accentColor: config.accentColor,
            appDisplayName: config.appDisplayName,
            continueAction: continueAction,
            dataPrivacyContent: dataPrivacyContent
        )
    }
}

#Preview {
    WelcomeScreen(
        config: .mock,
        appIcon: Image(.mockAppIcon),
        continueAction: {
            print("Continue Tapped")
        },
        dataPrivacyContent: {
            Text("Privacy Policy Content")
        }
    )
}
