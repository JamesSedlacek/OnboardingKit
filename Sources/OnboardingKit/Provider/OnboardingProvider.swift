//
//  OnboardingProvider.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import Foundation

@Observable
public final class OnboardingProvider: OnboardingProviding {
    private static let onboardingKey = "isOnboardingCompleted"
    private let userDefaults: UserDefaults
    let configuration: OnboardingConfiguration

    var isCompleted: Bool {
        get {
            access(keyPath: \.isCompleted)
            return userDefaults.bool(forKey: Self.onboardingKey)
        }
        set {
            withMutation(keyPath: \.isCompleted) {
                userDefaults.set(newValue, forKey: Self.onboardingKey)
            }
        }
    }

    public init(storage: UserDefaults = .standard,
                configuration: OnboardingConfiguration) {
        self.userDefaults = storage
        self.configuration = configuration
    }
    
    func resetOnboardingState() {
        isCompleted = false
    }
}

extension OnboardingProvider {
    static let mock: OnboardingProvider = .init(configuration: .mock)
}
