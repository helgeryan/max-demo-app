//
//  DownloadContinueWatchingView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MyStuffContinueWatchingView: View {
    @EnvironmentObject var mediaManager: MediaManager
    var body: some View {
        VStack {
            ForEach(mediaManager.items, id: \.self) { item in
                ContinueWatchingMediaItemRowView(mediaItem: item)
                    .padding()
            }
        }
    }
}
