//
//  TitleSection.swift
//  
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct TitleSection {
    private let config: OnboardingConfiguration
    private let appIcon: Image
    private let shouldHideAppIcon: Bool
    @State private var isAnimating = false

    init(
        config: OnboardingConfiguration,
        appIcon: Image,
        shouldHideAppIcon: Bool
    ) {
        self.config = config
        self.appIcon = appIcon
        self.shouldHideAppIcon = shouldHideAppIcon
    }

    private func onAppear() {
        withAnimation(.easeInOut(duration: 0.8)) {
            isAnimating = true
        }
    }
}

@MainActor
extension TitleSection: View {
    var body: some View {
        VStack(alignment: config.titleSectionAlignment, spacing: 2) {
            appIconView
            welcomeToText
            appDisplayNameText
        }
        .frame(
            maxWidth: .infinity,
            alignment: config.titleSectionAlignment.toAlignment
        )
        .padding(.horizontal, 64)
        .font(.largeTitle)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1.0 : 0.5)
        .onAppear(perform: onAppear)
    }

    @ViewBuilder
    private var appIconView: some View {
        if shouldHideAppIcon {
            appIcon
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.bottom)
        }
    }

    private var welcomeToText: some View {
        Text(.welcomeTo)
            .foregroundColor(.primary)
            .fontWeight(.semibold)
    }

    private var appDisplayNameText: some View {
        Text(config.appDisplayName)
            .foregroundStyle(config.accentColor)
            .fontWeight(.bold)
    }
}

#Preview {
    TitleSection(
        config: .mock,
        appIcon: Image(.mockAppIcon),
        shouldHideAppIcon: true
    )
}
