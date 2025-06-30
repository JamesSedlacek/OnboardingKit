//
//  BottomSection.swift
//  
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct BottomSection<C: View> {
    private let accentColor: Color
    private let appDisplayName: String
    private let continueAction: () -> Void
    private let dataPrivacyContent: () -> C
    @State private var isDataPrivacyPresented: Bool = false
    @State private var isAnimating: Bool = false

    init(
        accentColor: Color,
        appDisplayName: String,
        continueAction: @escaping () -> Void,
        @ViewBuilder dataPrivacyContent: @escaping () -> C
    ) {
        self.accentColor = accentColor
        self.appDisplayName = appDisplayName
        self.continueAction = continueAction
        self.dataPrivacyContent = dataPrivacyContent
    }

    private func onAppear() {
        withAnimation(.easeInOut(duration: 0.8).delay(2.8)) {
            isAnimating = true
        }
    }

    private func disclosureAction() {
        isDataPrivacyPresented.toggle()
    }
}

@MainActor
extension BottomSection: View {
    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            dataPrivacyImage
            disclosureText
            continueButton
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 24)
        .background(.background.secondary)
        .mask(opacityLinearGradient)
        .opacity(isAnimating ? 1 : 0)
        .sheet(
            isPresented: $isDataPrivacyPresented,
            content: dataPrivacyContent
        )
        .onAppear(perform: onAppear)
    }

    private var dataPrivacyImage: some View {
        Image(.dataPrivacy)
            .resizable()
            .foregroundStyle(accentColor)
            .frame(width: 40, height: 40)
    }

    private var disclosureText: some View {
        Group {
            Text(verbatim: .dataPrivacy(for: appDisplayName))
                .foregroundStyle(.secondary) +
            Text(.dataPrivacyButtonTitle, bundle: .module)
                .foregroundStyle(accentColor)
                .bold()
        }
        .multilineTextAlignment(.center)
        .font(.caption)
        .padding(.bottom, 24)
        .padding(.top, 6)
        .onTapGesture(perform: disclosureAction)
    }

    private var continueButton: some View {
        Button(
            action: continueAction,
            label: continueText
        )
        .font(.title3.weight(.medium))
        .buttonStyle(.borderedProminent)
        .tint(accentColor)
    }

    private func continueText() -> some View {
        Text(.continueButtonTitle, bundle: .module)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
    }

    private func opacityLinearGradient() -> some View {
        LinearGradient(
            colors: [.black.opacity(0.9), .black, .black, .black],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    VStack {
        Spacer()
    }
    .safeAreaInset(edge: .bottom) {
        BottomSection(
            accentColor: .blue,
            appDisplayName: .init("Test App"),
            continueAction: {
                print("Continue Tapped")
            },
            dataPrivacyContent: {
                Text("Privacy Policy Content")
            }
        )
    }
}
