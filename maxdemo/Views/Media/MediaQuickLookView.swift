//
//  MediaQuickLookView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct MediaQuickLookView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @State var isSharePresented: Bool = false
    let item: MediaItem
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .bold))
                        .padding()
                    
                    Text(item.shortDescription)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.horizontal)
                    
                    HStack {
                        let isFaved = mediaManager.myListItems.contains(item)
                        let image = isFaved ? "checkmark" : "plus"
                        MediaActionButton(text: "My List", systemImage: image, action: {
                            if isFaved {
                                mediaManager.myListItems = mediaManager.myListItems.filter({ return item != $0 })
                            } else {
                                mediaManager.myListItems.append(item)
                            }
                        })
                        .padding()
                        MediaActionButton(text: "Trailer", systemImage: "movieclapper", action: {
                            
                        })
                        .padding()
                        MediaActionButton(text: "Share", systemImage: "square.and.arrow.up", action: {
                            isSharePresented = true
                        })
                        .sheet(isPresented: $isSharePresented, content: {
                            ActivityViewController(activityItems: [URL(string: item.link)!])
                                .presentationDetents([.height(300)])
                        })
                        .padding()
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
        .background(Color.darkGray)
    }
}
