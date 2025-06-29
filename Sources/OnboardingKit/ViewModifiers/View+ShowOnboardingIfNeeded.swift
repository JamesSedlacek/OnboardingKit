//
//  View+ShowOnboardingIfNeeded.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

/// Extension providing onboarding functionality to any SwiftUI View.
///
/// This extension adds a convenient modifier that automatically handles the display
/// of onboarding content based on the user's completion status. It provides a
/// declarative way to integrate onboarding into your app's view hierarchy.
public extension View {
    /// Conditionally shows onboarding content if the user hasn't completed it yet.
    ///
    /// This modifier wraps your view and automatically displays the onboarding screen
    /// when needed, or shows your original content when onboarding is complete.
    /// The onboarding state is automatically managed using AppStorage.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// ContentView()
    ///     .showOnboardingIfNeeded(
    ///         config: OnboardingConfiguration(
    ///             appDisplayName: "My App",
    ///             features: myFeatures
    ///         ),
    ///         appIcon: Image("AppIcon"),
    ///         dataPrivacyContent: {
    ///             PrivacyPolicyView()
    ///         }
    ///     )
    /// ```
    ///
    /// ## Custom Continue Action
    ///
    /// ```swift
    /// ContentView()
    ///     .showOnboardingIfNeeded(
    ///         config: config,
    ///         appIcon: appIcon,
    ///         continueAction: {
    ///             // Custom logic before marking as complete
    ///             analytics.track("onboarding_completed")
    ///             // Onboarding will be marked complete automatically
    ///         },
    ///         dataPrivacyContent: { PrivacyView() }
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - storage: The AppStorage property for tracking completion state (defaults to `.onboarding`)
    ///   - config: Configuration for customizing the onboarding experience
    ///   - appIcon: The app icon image to display in the onboarding
    ///   - continueAction: Optional custom action to perform when continuing (defaults to marking complete)
    ///   - dataPrivacyContent: A view builder that provides the data privacy content
    ///
    /// - Returns: A modified view that conditionally shows onboarding content
    func showOnboardingIfNeeded<C: View>(
        storage: AppStorage<Bool> = .onboarding,
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: (() -> Void)? = nil,
        @ViewBuilder dataPrivacyContent: @escaping () -> C
    ) -> some View {
        modifier(
            OnboardingModifier<C, EmptyView>(
                storage: storage,
                config: config,
                appIcon: appIcon,
                continueAction: continueAction,
                dataPrivacyContent: dataPrivacyContent,
                flowContent: nil
            )
        )
    }

    /// Conditionally shows onboarding content if the user hasn't completed it yet, then performs a custom onboarding flow.
    ///
    /// This overload allows you to present a custom "flow" after the initial onboarding welcome screen is completed.
    /// The `flowContent` closure is displayed after the user continues on the welcome screen but before onboarding is marked complete.
    /// This enables richer onboarding experiences such as personal setup steps, permissions prompts, tutorials, etc.
    ///
    /// ## Usage
    /// ```swift
    /// ContentView()
    ///     .showOnboardingIfNeeded(
    ///         config: config,
    ///         appIcon: appIcon,
    ///         dataPrivacyContent: { PrivacyView() },
    ///         flowContent: {
    ///             MyOnboardingSetupView(onFinish: { ... })
    ///         }
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - storage: The AppStorage property for tracking completion state (defaults to `.onboarding`)
    ///   - config: Configuration for customizing the onboarding experience
    ///   - appIcon: The app icon image to display in the onboarding
    ///   - continueAction: Optional custom action to perform when continuing (defaults to marking complete)
    ///   - dataPrivacyContent: A view builder that provides the data privacy content
    ///   - flowContent: A view builder for displaying custom content after the welcome screen but before marking onboarding complete
    ///
    /// - Returns: A modified view that conditionally shows onboarding content followed by a custom flow
    func showOnboardingIfNeeded<C: View, F: View>(
        storage: AppStorage<Bool> = .onboarding,
        config: OnboardingConfiguration,
        appIcon: Image,
        continueAction: (() -> Void)? = nil,
        @ViewBuilder dataPrivacyContent: @escaping () -> C,
        @ViewBuilder flowContent: @escaping () -> F
    ) -> some View {
        modifier(
            OnboardingModifier<C, F>(
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

struct OnboardingModifier<C: View, F: View> {
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
}

extension OnboardingModifier: ViewModifier {
    func body(content: Content) -> some View {
        if isOnboardingCompleted {
            content
        } else if let flowContent, isWelcomeScreenCompleted {
            flowContent()
        } else {
            WelcomeScreen(
                config: config,
                appIcon: appIcon,
                continueAction: continueAction,
                dataPrivacyContent: dataPrivacyContent
            )
        }
    }
}

#Preview("Welcome Screen Only") {
    VStack {
        Spacer()
    }
    .showOnboardingIfNeeded(
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
    .showOnboardingIfNeeded(
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
