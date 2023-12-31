//
//  Color+Extensions.swift
//
//  Created by James Sedlacek on 12/31/23.
//

import SwiftUI

extension Color {
#if canImport(AppKit)
    static let secondaryBackground = Color(nsColor: .windowBackground)
#endif

#if canImport(UIKit)
    static let secondaryBackground = Color(uiColor: .secondarySystemGroupedBackground)
#endif
}
