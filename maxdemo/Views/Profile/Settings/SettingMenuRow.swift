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
    var navigationType: NavigationType?  = nil
    var action: (() -> ())? = nil
}

struct SettingMenuRow: View {
    let item: SettingsMenuItem
    
    var body: some View {
        let textContent = Text(item.text)
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .bold))
            .padding(12)
        if let action = item.action {
            Button {
                action()
            } label: {
                HStack {
                    textContent
                    Spacer()
                }
            }
        } else if let type = item.navigationType {
            NavigationLink(value: type, label: {
                HStack {
                    textContent
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                        .padding(12)
                }
            })
        }
        
    }
}
