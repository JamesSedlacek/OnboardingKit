//
//  WelcomeScreen.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

@MainActor
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
        Animation.welcomeScreen.deferred {
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
        .scrollIndicators(.hidden)
        .defaultScrollAnchor(.center, for: .alignment)
        .scrollBounceBehavior(.basedOnSize)
        .background(.background.secondary)
        .safeAreaInset(edge: .bottom, content: bottomSection)
        .onAppear(perform: onAppear)
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
