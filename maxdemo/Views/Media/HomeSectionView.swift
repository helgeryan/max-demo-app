//
//  HomeSectionView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation
import SwiftUI

struct HomeSectionView: View {
    var section: HomeSection
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(section.title)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .padding(.top, 8)
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(section.items, id: \.imageName) { item in
                    switch section.type {
                    case .general:
                        MediaItemRowView(mediaItem: item)
                            .padding(.leading)
                    case .watching:
                        ContinueWatchingMediaItemView(mediaItem: item)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}
