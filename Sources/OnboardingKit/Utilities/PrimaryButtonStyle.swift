//
//  PrimaryButtonStyle.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(OnboardingProvider.self)
    private var onboardingProvider

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(12)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(onboardingProvider.configuration.accentColor)
            .clipShape(.rect(cornerRadius: 10))
    }
}
