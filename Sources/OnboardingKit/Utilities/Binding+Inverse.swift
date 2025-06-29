//
//  Binding+Inverse.swift
//  OnboardingKit
//
//  Created by James Sedlacek on 6/28/25.
//

import SwiftUI

public extension Binding where Value == Bool {
    /// A binding to the inverse of the boolean value.
    var inverse: Binding<Bool> {
        Binding<Bool>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
