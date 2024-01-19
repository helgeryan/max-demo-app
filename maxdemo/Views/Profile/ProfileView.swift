//
//  ProfileView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var profileManager: ProfileManager
    var body: some View {
        VStack(spacing: 0) {
            ProfileTopBar()
                .padding(.horizontal)
            
            ProfilesListView(account: profileManager.account)
                .padding(.top)
            
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
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(
            LinearGradient(colors: [.black, .black, .black, Color("darkblue")], startPoint: .top, endPoint: .bottom))
        
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
