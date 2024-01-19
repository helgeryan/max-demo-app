//
//  WelcomeView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var profileManager: ProfileManager
    var body: some View {
//        ZStack {
//            Image("welcome")
//                .resizable()
//                .scaledToFill()
//                .clipped()
//                .frame(width: .fullScreenWidth, height: .fullScreenHeight)
            
            VStack(spacing: 0) {
                Spacer()
                Image("max")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(height: 35)
                
                Text("Start Streaming Now")
                    .padding(.top, 40)
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Text("Get ready to dive into the greatest stories in tv and film.")
                    .padding()
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .regular))
                
                Button {
                    debugPrint("Doing subscribe")
                } label: {
                    Text("Subscribe Now")
                        .foregroundStyle(.black)
                        .font(.system(size: 15, weight: .bold))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                }
                .padding()
                
                Button {
                    debugPrint("Doing sign in")
                    profileManager.signIn()
                } label: {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .font(.system(size: 15, weight: .bold))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("editcolor"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
                
                
                Button {
                    debugPrint("Doing privacy and terms")
                } label: {
                    Text("Privacy and terms")
                        .font(.system(size: 15, weight: .bold))
                }
                .padding(.bottom, 50)
            }
            .ignoresSafeArea()
            .background(content: {
                Image("welcome")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(.black.opacity(0.2))
            })
        
//        }
    }
}

#Preview {
    WelcomeView()
}
