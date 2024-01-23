//
//  AppSettingsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct AppSettingsView: View {
    @AppStorage("isStreamOverCellular") private var isStreamOverCellular: Bool = false
    @AppStorage("isAutoPlayNextEpisode") private var isAutoPlayNextEpisode: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            ProfileTopBar()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("App Settings View")
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .bold))
                        .padding([.horizontal, .top])
                    VStack(alignment:.leading, spacing: 0) {
                        SettingToggleView(isSettingOn: $isStreamOverCellular, text: "Stream Over Cellular")
                            .padding(.horizontal)
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(height: 1)
                        SettingToggleView(isSettingOn: $isAutoPlayNextEpisode, text: "Auto Play Next Episode")
                            .padding(.horizontal)
                    }
                    .background(Color.profileSettings)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .clipped()
                    .padding()
                }
                
                MaxNavigationLink(text: "Download Settings", navigationValue: .downloadSettings)
                    .padding([.horizontal, .top])
                
                MaxNavigationLink(text: "Notifications", navigationValue: .notificationSettings)
                    .padding([.horizontal, .top])
                
                MaxLink(urlString: "https://auth.max.com/login?flow=parentCodeWebHandoff&redirectTo=%2Fparent-code-web-handoff", text: "Manage Parent Code")
                    .padding([.horizontal, .top])
                
                MaxNavigationLink(text: "Info", navigationValue: .deviceInfo)
                    .padding([.horizontal, .top])
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .modifier(GradientBackground())
    }
}

#Preview {
    AppSettingsView()
}
