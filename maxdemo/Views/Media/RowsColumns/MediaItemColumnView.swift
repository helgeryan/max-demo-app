//
//  MediaItemRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MediaItemColumnView: View {
    var mediaItem: MediaItem
    var width: CGFloat = 120
    var height: CGFloat = 200
    var body: some View {
        ZStack {
            Image(mediaItem.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
            
            HStack {
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
    }
}

#Preview {
    MediaItemColumnView(mediaItem: MediaItem(title: "Peacemaker", imageName: "peacemaker", shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2"))
}
