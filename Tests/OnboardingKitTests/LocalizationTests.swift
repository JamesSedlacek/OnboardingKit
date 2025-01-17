//
//  LocalizationTest.swift
@testable import OnboardingKit
import XCTest

final class LocalizationTest: XCTestCase {
    func testLocalizedStringsFilesExist() {
        let stringsFilePaths = Bundle.module.paths(forResourcesOfType: "strings", inDirectory: nil)
        let expectedGermanPathSuffix = "/de.lproj/Localizable.strings"
        let expectedEnglishPathSuffix = "/en.lproj/Localizable.strings"

        var germanStringsFileExists = false
        var englishStringsFileExists = false

        for path in stringsFilePaths {
            if path.hasSuffix(expectedGermanPathSuffix) {
                germanStringsFileExists = true
            }
            if path.hasSuffix(expectedEnglishPathSuffix) {
                englishStringsFileExists = true
            }
        }

        XCTAssertTrue(germanStringsFileExists, "German Localizable.strings file is missing.")
        XCTAssertTrue(englishStringsFileExists, "English Localizable.strings file is missing.")
    }
}
