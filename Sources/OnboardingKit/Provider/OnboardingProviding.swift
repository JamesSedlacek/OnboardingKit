//
//  OnboardingProviding.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import Foundation

protocol OnboardingProviding: AnyObject, Observable {
    var isCompleted: Bool { get set }
    var isShowingOnboarding: Bool { get }
    var configuration: OnboardingConfiguration { get }

    func completeOnboarding()
    func resetOnboardingState()
}

extension OnboardingProviding {
    var isShowingOnboarding: Bool {
        !isCompleted
    }

    func completeOnboarding() {
        isCompleted = true
    }
}
