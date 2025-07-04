//
//  HorizontalAlignment+ToAlignment.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 6/28/25.
//

import SwiftUI

/// Extension providing conversion utilities for HorizontalAlignment.
///
/// This extension adds convenience methods to convert SwiftUI's `HorizontalAlignment`
/// values to their corresponding `Alignment` counterparts, useful when you need to
/// work with different alignment types in the same context.
extension HorizontalAlignment {
    /// Converts a HorizontalAlignment to its corresponding Alignment value.
    ///
    /// This computed property provides a convenient way to map horizontal alignment
    /// values to their full alignment equivalents, which can be useful when working
    /// with views that expect different alignment types.
    ///
    /// ## Mapping
    ///
    /// - `.leading` → `.leading`
    /// - `.center` → `.center`  
    /// - `.trailing` → `.trailing`
    /// - Any other value → `.leading` (default fallback)
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let horizontalAlignment: HorizontalAlignment = .center
    /// let alignment: Alignment = horizontalAlignment.toAlignment
    /// // alignment is now .center
    /// ```
    ///
    /// - Returns: The corresponding `Alignment` value for the horizontal alignment.
    var toAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        default:
            return .leading
        }
    }
}
