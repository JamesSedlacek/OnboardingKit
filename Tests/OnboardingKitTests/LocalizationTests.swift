@testable import OnboardingKit
import XCTest

final class LocalizationTest: XCTestCase {
    func testLocalizedStringsFilesExist() {
        // List of expected languages
        let expectedLanguages = ["de", "en"] // Add more languages as needed

        // Get the resource bundle's base URL
        guard let resourcesURL = Bundle.module.resourceURL else {
            XCTFail("Resource URL for the module bundle is unavailable.")
            return
        }

        // Check for each language's .lproj directory
        for language in expectedLanguages {
            let languageDirectory = resourcesURL.appendingPathComponent("\(language).lproj")
            let stringsFile = languageDirectory.appendingPathComponent("Localizable.strings")
            XCTAssertTrue(FileManager.default.fileExists(atPath: stringsFile.path), "\(language) Localizable.strings file is missing.")
        }
    }
}
