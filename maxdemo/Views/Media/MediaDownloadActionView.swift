//
//  MediaDownloadActionView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/23/24.
//

import SwiftUI

struct MediaDownloadActionView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @Binding var isPresented: Bool
    let item: MediaItem
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .bold))
                        .padding()
                    
                    Text("Expired")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    Text("Expires 30 days after download or 48 hours after you start watching. You can renew downloads anytime your online")
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    MediaDownloadActionButton(systemImage: "arrow.counterclockwise", text: "Renew Download", action: {
                        isPresented = false
                    })
                    .padding([.horizontal, .top])
                    
                    MediaDownloadActionButton(systemImage: "xmark", text: "Cancel Download", action: {
                        mediaManager.myDowloadedItems = mediaManager.myDowloadedItems.filter({ return item != $0 })
                        isPresented = false
                    })
                    .padding([.horizontal, .top])
                    
                    
                    MediaDownloadActionButton(systemImage: "info.circle", text: "More Info", action: {
                        isPresented = false
                    })
                    .padding([.horizontal, .top])
                }
                Spacer()
            }
        }
        .background(Color.darkGray)
    }
}
