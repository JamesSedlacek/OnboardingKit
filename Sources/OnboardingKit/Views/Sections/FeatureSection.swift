//
//  SwiftUIView.swift
//  
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct FeatureSection: View {
    @State private var isAnimating: [Bool]
    private let features: [FeatureInfo]
    private let accentColor: Color

    init(features: [FeatureInfo], accentColor: Color) {
        self._isAnimating = State(initialValue: Array(repeating: false, count: features.count))
        self.features = features
        self.accentColor = accentColor
    }

    var body: some View {
        ForEach(features.indices, id: \.self) { index in
            FeatureView(info: features[index], accentColor: accentColor)
                .opacity(isAnimating[index] ? 1 : 0)
                .offset(y: isAnimating[index] ? 0 : 100)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.8).delay(1.6 + Double(index) * 0.16)) {
                        isAnimating[index] = true
                    }
                }
        }
    }
}

#Preview {
    VScrollView {
        VStack(spacing: 20) {
            FeatureSection(features: OnboardingConfiguration.mock.features, accentColor: .blue)
        }
        .padding(40)
    }
}
