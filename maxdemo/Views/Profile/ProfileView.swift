//
//  ProfileView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct SettingsMenuItem {
    let id: String = UUID().uuidString
    let text: String
    let isPush: Bool
}

struct AccountView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @Environment(\.dismiss) var dismiss
    
    let settingsMenuItems: [SettingsMenuItem] = [
        .init(text: "App Settings", isPush: true),
        .init(text: "Account", isPush: true),
        .init(text: "Subscription", isPush: true),
        .init(text: "Privacy & Terms", isPush: true),
        .init(text: "Help", isPush: false),
        .init(text: "Sign out", isPush: false)
    ]
    
    var body: some View {
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
                        Button {
                            debugPrint("Doing \(item.text)")
                            dismiss()
                            profileManager.signOut()
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
 
struct ProfilesListView: View {
    let account: Account
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(account.profiles, id: \.name) {  profile in
                    ProfileView(profile: profile)
                        .padding([.leading, .top])
                }
            }
        }
    }
}

struct ProfileView: View {
    @EnvironmentObject var profileManager: ProfileManager
    let profile: Profile
    var body: some View {
        Button {
            profileManager.selectedProfile = profile
        } label: {
            VStack(spacing: 0) {
                VStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .clipped()
                }
                .frame(width: 90, height: 90)
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: profileManager.selectedProfile == profile ? 2 : 0)
                )
                Text(profile.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 5)
            }
        }
    }
}

struct ProfileTopBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
            }
            .padding()
            
            Spacer()
        }
    }
}
