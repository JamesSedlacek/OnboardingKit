//
//  VScrollView.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

/// Custom vertical scroll view with centered content vertically
struct VScrollView<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                content
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
            }
        }
    }
}
