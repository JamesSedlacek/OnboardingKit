//
//  BottomSection.swift
//  
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct BottomSection: View {
    @Environment(OnboardingProvider.self)
    private var onboardingProvider
    @State private var isDataPrivacyPresented = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            Image(.dataPrivacy)
                .resizable()
                .foregroundStyle(onboardingProvider.configuration.accentColor)
                .frame(width: 32, height: 32)
            Group {
                let dataCollectionInfoMsg = String.localizedStringWithFormat(
                    NSLocalizedString("data_collection_info", bundle: .module, comment: "Data collection info"),
                    Bundle.main.displayName
                )
                Text(dataCollectionInfoMsg)
                    .foregroundStyle(.secondary) +
                Text("data_management", bundle: .module, comment: "Data management info")
                    .foregroundStyle(onboardingProvider.configuration.accentColor)
                    .bold()
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 10))
            .padding(.bottom, 24)
            .padding(.top, 4)
            .onTapGesture {
                isDataPrivacyPresented.toggle()
            }

            Button("Continue") {
                onboardingProvider.completeOnboarding()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 24)
        .background(BlurView.background)
        .opacity(isAnimating ? 1 : 0)
        .sheet(isPresented: $isDataPrivacyPresented) {
            DataPrivacyView(accentColor: onboardingProvider.configuration.accentColor,
                            urlString: onboardingProvider.configuration.privacyUrlString)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8).delay(2.2)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
    }
    .safeAreaInset(edge: .bottom) {
        BottomSection()
    }
    .environment(OnboardingProvider.mock)
}
