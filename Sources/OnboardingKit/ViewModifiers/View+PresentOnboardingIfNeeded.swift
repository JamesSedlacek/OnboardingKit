//
//  View+PresentOnboardingIfNeeded.swift
//
//  Created by James Sedlacek on 6/28/24.
//

import SwiftUI

/// Extension providing onboarding sheet functionality to any SwiftUI View.
///
/// This extension adds a convenient modifier that presents the onboarding experience modally
/// in a sheet when needed, instead of conditionally swapping the root content.
public extension View {
    /// Presents onboarding content as a sheet if the user hasn't completed it yet.
    ///
    /// This modifier presents the onboarding screen as a sheet over your view hierarchy
    /// while the onboarding is not complete, and dismisses automatically afterwards.
    ///
    /// - Parameters:
    ///   - storage: The AppStorage property for tracking completion state (defaults to `.onboarding`)
    ///   - config: Configuration for customizing the onboarding experience
    ///   - appIcon: The app icon image to display in the onboarding
    ///   - continueAction: Optional custom action to perform when continuing (defaults to marking complete)
    ///   - dataPrivacyContent: A view builder that provides the data privacy content
    ///
    /// - Returns: A view that presents onboarding in a sheet when needed
    func presentOnboardingIfNeeded<C: View>(
        storage: AppStorage<Bool> = .onboarding,
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: (() -> Void)? = nil,
        @ViewBuilder dataPrivacyContent: @escaping () -> C
    ) -> some View {
        modifier(
            OnboardingSheetModifier<C, EmptyView>(
                storage: storage,
                config: config,
                appIcon: appIcon,
                continueAction: continueAction,
                dataPrivacyContent: dataPrivacyContent,
                flowContent: nil
            )
        )
    }

    /// Presents onboarding as a sheet and allows for a custom onboarding flow after the welcome screen.
    ///
    /// - Parameters:
    ///   - flowContent: A view builder for additional steps after the welcome screen.
    func presentOnboardingIfNeeded<C: View, F: View>(
        storage: AppStorage<Bool> = .onboarding,
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: (() -> Void)? = nil,
        @ViewBuilder dataPrivacyContent: @escaping () -> C,
        @ViewBuilder flowContent: @escaping () -> F
    ) -> some View {
        modifier(
            OnboardingSheetModifier<C, F>(
                storage: storage,
                config: config,
                appIcon: appIcon,
                continueAction: continueAction,
                dataPrivacyContent: dataPrivacyContent,
                flowContent: flowContent
            )
        )
    }
}

@MainActor
private struct OnboardingSheetModifier<C: View, F: View> {
    private let config: OnboardingConfiguration
    private let appIcon: Image
    private let _continueAction: (() -> Void)?
    private let dataPrivacyContent: () -> C
    private let flowContent: (() -> F)?
    @AppStorage private var isOnboardingCompleted: Bool
    @State private var isWelcomeScreenCompleted: Bool = false

    init(
        storage: AppStorage<Bool>,
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: (() -> Void)?,
        @ViewBuilder dataPrivacyContent: @escaping () -> C,
        flowContent: (() -> F)? = nil
    ) {
        self._isOnboardingCompleted = storage
        self.config = config
        self.appIcon = appIcon
        self._continueAction = continueAction
        self.dataPrivacyContent = dataPrivacyContent
        self.flowContent = flowContent
    }

    private func continueAction() {
        if let action = _continueAction {
            action()
            isWelcomeScreenCompleted = true
        } else if flowContent != nil {
            isWelcomeScreenCompleted = true
        } else {
            isOnboardingCompleted = true
        }
    }

    private func onSheetDismiss() {
        isOnboardingCompleted = true
    }
}

extension OnboardingSheetModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .sheet(
                isPresented: $isOnboardingCompleted.inverse,
                onDismiss: onSheetDismiss,
                content: sheetContent
            )
    }

    @ViewBuilder
    private func sheetContent() -> some View {
        if let flowContent, isWelcomeScreenCompleted {
            flowContent()
        } else {
            WelcomeScreen(
                config: config,
                appIcon: appIcon,
                continueAction: continueAction,
                dataPrivacyContent: dataPrivacyContent
            )
            .interactiveDismissDisabled(true)
        }
    }
}

#Preview("Welcome Screen Only") {
    VStack {
        Spacer()
    }
    .presentOnboardingIfNeeded(
        config: .mock,
        appIcon: Image(.mockAppIcon),
        dataPrivacyContent: {
            Text("Privacy Policy Content")
        }
    )
}

#Preview("Welcome Screen with Flow") {
    VStack {
        Spacer()
    }
    .presentOnboardingIfNeeded(
        config: .mock,
        appIcon: Image(.mockAppIcon),
        dataPrivacyContent: {
            Text("Privacy Policy Content")
        },
        flowContent: {
            Text("Flow Content")
        }
    )
}
