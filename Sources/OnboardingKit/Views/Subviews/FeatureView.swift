//
//  FeatureView.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct FeatureView: View {
    let info: FeatureInfo
    let accentColor: Color

    var body: some View {
        HStack(spacing: 12) {
            info.image
                .font(.title)
                .foregroundStyle(accentColor)
                .frame(minWidth: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text(info.title)
                    .foregroundStyle(.primary)
                    .font(.system(size: 13, weight: .semibold))
                Text(info.content)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 12, weight: .regular))
            }
            Spacer()
        }
    }
}

#Preview {
    FeatureView(info: .mock, accentColor: .blue)
        .padding(40)
}
