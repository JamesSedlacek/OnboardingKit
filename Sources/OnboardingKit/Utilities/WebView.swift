//
//  WebView.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI
import WebKit

#if canImport(UIKit)
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView { .init() }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
struct WebView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView { .init() }

    func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
#endif
