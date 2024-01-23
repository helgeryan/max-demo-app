//
//  SettingToggleView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct SettingToggleView: View {
    @Binding var isSettingOn: Bool
    let text: String
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .foregroundStyle(.white)
                .lineLimit(1)
                .font(.system(size: 14, weight: .bold))
                .padding([.leading, .vertical], 12)
            
            Spacer()
            Toggle("", isOn: $isSettingOn)
                .labelsHidden()
                .tint(.purple)
                .padding(.trailing, 2)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .clipped()
    }
}

