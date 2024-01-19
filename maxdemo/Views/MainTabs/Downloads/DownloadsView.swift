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
            
            HStack {
                Button {
                    debugPrint("Editting profiles")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color("editcolor"))
                            .frame(width: 40, height: 40)
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .foregroundStyle(.white)
                    }
                    .background(Color("editcolor"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
                    .frame(width: 40, height: 40)
                }
                Spacer()
                
                Button {
                    debugPrint("Editting profiles")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color("editcolor"))
                            .frame(width: 160, height: 40)
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
                        Text(profileManager.selectedProfile.name)
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
            
            
            Spacer()
            
            
        }
        .modifier(GradientBackground())
    }
}

#Preview {
    DownloadsView()
}
