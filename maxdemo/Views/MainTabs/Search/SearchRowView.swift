//
//  SearchRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI


struct SearchRowView: View {
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
                    Text(mediaItem.title)
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
            }
        })
    }
}