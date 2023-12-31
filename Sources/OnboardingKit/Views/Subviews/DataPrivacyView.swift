//
//  DataPrivacyView.swift
//
//  Created by James Sedlacek on 12/30/23.
//

import SwiftUI

struct DataPrivacyView: View {
    @Environment(\.dismiss)
    private var dismiss
    private let accentColor: Color
    private let url: URL?

    init(accentColor: Color, urlString: String) {
        self.accentColor = accentColor
        self.url = URL(string: urlString)
    }

    var body: some View {
        Group {
            if let url {
                WebView(url: url)
            } else {
                VStack(alignment: .leading) {
                    Text("404 Error")
                    Text("Page Not Found")
                        .foregroundStyle(accentColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 40, weight: .semibold))
            }
        }
        .overlay {
            VStack {
                Spacer()
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 28)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    DataPrivacyView(accentColor: .blue, urlString: "")
}
