//
//  ContinueWatchingMediaItemRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct ContinueWatchingMediaItemRowView: View {
    var mediaItem: MediaItem
    var body: some View {
        NavigationLink(value: mediaItem, label: {
            HStack(spacing: 0) {
                Image(mediaItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 80)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(mediaItem.seasonEpisodeString)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 16, weight: .bold))
                    
                    Text(mediaItem.tvRating)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 12, weight: .regular))
                }
                .padding()
                
                Spacer()
                
                MediaMenuButton(item: mediaItem)
            }
        })
    }
}
