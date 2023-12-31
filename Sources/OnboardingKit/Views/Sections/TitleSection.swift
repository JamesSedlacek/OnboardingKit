//
//  TitleSection.swift
//  
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct TitleSection: View {
    @Environment(OnboardingProvider.self)
    private var onboardingProvider
    @State private var isAnimating = false
    let shouldHideAppIcon: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if shouldHideAppIcon {
                Image.appIcon
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom)
            }
            Text("Welcome to")
                .foregroundColor(.primary)
                .fontWeight(.semibold)
            Text(Bundle.main.displayName)
                .foregroundStyle(onboardingProvider.configuration.accentColor)
                .fontWeight(.bold)
        }
        .font(.system(size: 38))
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1.0 : 0.5)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    TitleSection(shouldHideAppIcon: true)
        .padding(40)
        .environment(OnboardingProvider.mock)
}
