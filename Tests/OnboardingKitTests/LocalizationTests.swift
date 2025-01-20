@testable import OnboardingKit
import XCTest

final class LocalizationTest: XCTestCase {
    final class LocalizationTest: XCTestCase {
        func testLocalizationWorksInGeneral() {
            // This test verifies that the localization system is functional by checking
            // that a specific key ('welcome_to') returns a properly localized string
            // instead of the key itself or an empty string.
            let keyToCheck = "welcome_to"

            guard let localizedString = NSLocalizedString(keyToCheck, tableName: nil, bundle: .module, value: "", comment: "") as String?, !localizedString.isEmpty else {
                XCTFail("Missing or empty localized string for key '\(keyToCheck)'")
                return
            }

            XCTAssertNotEqual(localizedString, keyToCheck, "Localized string for key '\(keyToCheck)' is not properly localized.")
        }
    }
}
