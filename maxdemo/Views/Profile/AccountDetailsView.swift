//
//  AccountDetailsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct AccountDetailsView: View {
    @EnvironmentObject var profileManager: ProfileManager
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ProfileTopBar()
            Text("Account")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .padding()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Account Details")
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .bold))
                    .padding([.horizontal, .top])
                VStack(alignment:.leading, spacing: 0) {
                    MaxEditTextField(prompt: "Email Address", value: profileManager.account!.email, isSecureField: false)
                        .padding()
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 1)
                    MaxEditTextField(prompt: "Password", value: profileManager.account!.password, isSecureField: true)
                        .padding()
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 1)
                    MaxEditTextField(prompt: "Name", value: profileManager.account!.name, isSecureField: false)
                        .padding()
                }
                .background(Color.profileSettings)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
                .padding()
            }
            
            NavigationLink(value: NavigationType.devices, label: {
                HStack {
                    Text("Devices")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                        .padding(12)
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 15, height: 15)
                        .padding(12)
                }
                .background(Color.profileSettings)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
                .padding()
            })
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .modifier(GradientBackground())
    }
}

#Preview {
    AccountDetailsView()
}
