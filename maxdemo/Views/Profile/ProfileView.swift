//
//  ProfileView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

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
