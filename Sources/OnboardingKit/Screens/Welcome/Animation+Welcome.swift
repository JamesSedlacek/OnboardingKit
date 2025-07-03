//
//  Animation+Welcome.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 7/3/25.
//

import SwiftUI

extension Animation {
    static let welcomeScreen: Self = .easeInOut(duration: 0.8).delay(1.6)
    static let titleSection: Self = .easeInOut(duration: 0.8).delay(0.2)
    static let bottomSection: Self = .easeInOut(duration: 0.8).delay(2.8)

    static func feature(index: Int) -> Self {
        .easeInOut(duration: 0.8)
        .delay(1.6 + Double(index) * 0.16)
    }
}
