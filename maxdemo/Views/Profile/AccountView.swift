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
    @State var isAreYouSurePresented: Bool = false

    var body: some View {
        let settingsMenuItems: [SettingsMenuItem] = [
            .init(text: "App Settings", isPush: true, action: { }),
            .init(text: "Account", isPush: true, action: { }),
            .init(text: "Subscription", isPush: true, action: { }),
            .init(text: "Privacy & Terms", isPush: true, action: { }),
            .init(text: "Help", isPush: false, action: { }),
            .init(text: "Sign out", isPush: false, action: {
                withAnimation {
                    isAreYouSurePresented = true
                }
            })
        ]
        ZStack {
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
                    .background(Color.edit)
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
                    .background(Color.profileSettings)
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
            
            if isAreYouSurePresented {
                Color.black.opacity(0.3).ignoresSafeArea()
                
                AreYouSureView(isPresented: $isAreYouSurePresented, prompt: "Are you sure you want to sign out?", confirmationText: "Yes, Sign Out", confirmationAction: {
                    profileManager.signOut()
                })
                .animation(.easeInOut, value: isAreYouSurePresented)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .modifier(GradientBackground())
    }
}
