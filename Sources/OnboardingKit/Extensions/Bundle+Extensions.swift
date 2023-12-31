//
//  Bundle+Extensions.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import Foundation

extension Bundle {
    var appIcon: ImageRepresentable? {
        if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
           let primary = icons["CFBundlePrimaryIcon"] as? [String: Any],
           let files = primary["CFBundleIconFiles"] as? [String],
           let icon = files.last {
            return .init(named: icon)
        } else {
            return nil
        }
    }

    var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? "Default Display Name"
    }
}
