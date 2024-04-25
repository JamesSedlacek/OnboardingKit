//
//  Image+Extensions.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
typealias ImageRepresentable = NSImage
#endif

#if canImport(UIKit)
import UIKit
typealias ImageRepresentable = UIImage
#endif

extension Image {
    init?(_ image: ImageRepresentable?) {
        guard let image else { return nil }
#if canImport(UIKit)
        self.init(uiImage: image)
#endif
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(nsImage: image)
#endif
    }

    static let appIcon: Image = Image(Bundle.main.appIcon) ?? Image(.mockAppIcon)
}
