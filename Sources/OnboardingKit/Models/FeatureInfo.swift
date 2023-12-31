//
//  FeatureInfo.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

public struct FeatureInfo: Identifiable {
    public let id: UUID = .init()
    let image: Image
    let title: String
    let content: String

    public init(image: Image, title: String, content: String) {
        self.image = image
        self.title = title
        self.content = content
    }
}

extension FeatureInfo {
    static let mock: FeatureInfo = .init(image: Image(systemName: "barcode.viewfinder"),
                                         title: "Self-checkout at the Apple Store.",
                                         content: "Scan to pay for certain products right from your iPhone — no employee assistance required.")
}
