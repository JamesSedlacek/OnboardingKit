//
//  Animation+Deferred.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 7/3/25.
//


import SwiftUI

@MainActor
public extension Animation {
    /// Schedules this animation to run on the next run loop cycle.
    ///
    /// Use when state changes need to animate after layout/presentation completes (e.g. `.sheet` on macOS).
    ///
    /// - Parameter body: A closure with state changes to animate.
    func deferred(_ body: @escaping () -> Void) {
        DispatchQueue.main.async {
            withAnimation(self, body)
        }
    }
}
