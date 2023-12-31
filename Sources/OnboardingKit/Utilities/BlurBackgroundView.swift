//
//  File.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

#if canImport(UIKit)
struct BlurView: UIViewRepresentable {
    static let background = BlurView(style: .regular)
    let style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = UIAccessibility.isReduceTransparencyEnabled ? .systemBackground : nil
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
#endif

#if canImport(AppKit)
struct BlurView: NSViewRepresentable {
    static let background = BlurView(style: .withinWindow)
    let style: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let blurEffectView = NSVisualEffectView()
        blurEffectView.blendingMode = style
        blurEffectView.state = .active
        blurEffectView.autoresizingMask = [.width, .height]
        return blurEffectView
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
#endif
