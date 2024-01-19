//
//  ContinueWatchingMediaItemView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct ContinueWatchingMediaItemColumnView: View {
    var mediaItem: MediaItem
    var width: CGFloat = 250
    var height: CGFloat = 130
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(mediaItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                
                HStack {
                    
                    VStack {
                        Spacer()
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 20)
                            .padding(5)
                    }
                    Spacer()
                    VStack {
                        Button {
                            debugPrint("Do action items")
                        } label: {
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 20, height: 20)
                                .padding(5)
                        }
                        .shadow(radius: 10)
                        Spacer()
                    }
                }
            }
            .frame(width: width, height: height)
            .clipped()
            
            Text(mediaItem.seasonEpisodeString)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.top, 2)
            
            Text(mediaItem.tvRating)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.top,2)
            
        }
    }
}
