//
//  DownloadsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct DownloadsView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @EnvironmentObject var mediaManager: MediaManager
    var body: some View {
        VStack(spacing: 0) {
            DownloadHeaderView()
            
            let buttonHeight: CGFloat = 34
            HStack {
                Button {
                    debugPrint("Editting profiles")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color("editcolor"))
                            .frame(width: buttonHeight, height: buttonHeight)
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                
                Button {
                    debugPrint("Editting profiles")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color("editcolor"))
                            .frame(width: 130, height: buttonHeight)
                        Text("Edit")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Image("profile")
                            .resizable()
                            .foregroundStyle(.gray)
                            .frame(width: 25, height: 25)
                        Text(profileManager.selectedProfile?.name ?? "No profile selected")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .bold))
                        Spacer()
                    }
                    .padding([.horizontal,.top])
                    
                    ForEach(mediaManager.items, id: \.self) { item in
                        DownloadItemRowView(mediaItem: item)
                            .padding([.horizontal,.top])
                    }
                }
            }
            .padding(.top, 5)
            
            
            Spacer()
            
            
        }
        .modifier(GradientBackground())
    }
}

#Preview {
    DownloadsView()
}
