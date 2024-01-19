//
//  MediaItemRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MediaItemRowView: View {
    var mediaItem: MediaItem
    var body: some View {
        NavigationLink(value: mediaItem, label: {
            HStack {
                Image(mediaItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 80)
                    .clipped()
                
                Text(mediaItem.title)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
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

#Preview {
    MediaItemRowView(mediaItem: MediaItem(title: "Peacemaker", imageName: "peacemaker", shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2"))
}
