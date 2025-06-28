//
//  LocalizedStringKeys.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 6/28/25.
//

import SwiftUI

@MainActor
extension LocalizedStringKey {
    static let continueButtonTitle = LocalizedStringKey("Continue")
    static let welcomeTo = LocalizedStringKey("Welcome to")
    static let dataPrivacyButtonTitle = LocalizedStringKey("See how your data is managed...")
}

extension String {
    static func dataPrivacy(for appTitle: String) -> String {
        let formatString = String(localized: "dataPrivacy", bundle: .module)
        let formattedString = String.localizedStringWithFormat(formatString, appTitle)
        return formattedString
    }
}
