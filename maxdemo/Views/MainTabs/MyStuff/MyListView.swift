//
//  MyListView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MyListView: View {
    @EnvironmentObject var mediaManager: MediaManager
    var body: some View {
        VStack {
            ForEach(mediaManager.getMyList(), id: \.self) { item in
                MediaItemRowView(mediaItem: item)
                    .padding()
            }
        }
    }
}

