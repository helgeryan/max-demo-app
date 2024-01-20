//
//  SettingsRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/20/24.
//

import SwiftUI

struct SettingsMenuItem {
    let id: String = UUID().uuidString
    let text: String
    let isPush: Bool
    let action: () -> ()
}

struct SettingMenuRow: View {
    let item: SettingsMenuItem
    
    var body: some View {
        Button {
            item.action()
        } label: {
            HStack {
                Text(item.text)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(12)
                
                Spacer()
                
                if item.isPush {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                        .padding(12)
                }
            }
        }
    }
}
