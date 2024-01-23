//
//  MediaDownloadActionButton.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/23/24.
//

import SwiftUI

struct MediaDownloadActionButton: View {
    let systemImage: String
    let text: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 15, height: 15)
                Text(text)
                    .padding(.leading, 8)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .regular))
                Spacer()
            }
        }
    }
}
