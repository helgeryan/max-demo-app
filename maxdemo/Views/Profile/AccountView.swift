//
//  AccountView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/20/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        let settingsMenuItems: [SettingsMenuItem] = [
            .init(text: "App Settings", isPush: true, action: { }),
            .init(text: "Account", isPush: true, action: { }),
            .init(text: "Subscription", isPush: true, action: { }),
            .init(text: "Privacy & Terms", isPush: true, action: { }),
            .init(text: "Help", isPush: false, action: { }),
            .init(text: "Sign out", isPush: false, action: {
                    profileManager.signOut()
            })
        ]
        VStack(spacing: 0) {
            ProfileTopBar()
                .padding(.horizontal)
            if let account = profileManager.account {
                ProfilesListView(account: account)
                    .padding(.top)
            }
            
            Button {
                debugPrint("Editting profiles")
            } label: {
                ZStack {
                    Text("Edit Profiles")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                        .padding(12)
                }
                .background(Color("editcolor"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            }
            .padding(.top, 25)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(settingsMenuItems, id: \.id) { item in
                        SettingMenuRow(item: item)
                        
                        if item.id != settingsMenuItems.last?.id {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .background(Color("profilesettingscolor"))
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .clipped()
                .padding([.horizontal, .top])
                
                HStack {
                    let version = "2.5.0"
                    let build = "36"
                    Text("Version \(version) (\(build))")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .modifier(GradientBackground())
        
    }
}
