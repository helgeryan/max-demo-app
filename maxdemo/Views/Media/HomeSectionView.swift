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
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(section.items, id: \.imageName) { item in
                        NavigationLink(value: item, label: {
                            switch section.type {
                            case .general:
                                
                                MediaItemColumnView(mediaItem: item)
                                    .padding(.leading)
                            case .watching:
                                ContinueWatchingMediaItemColumnView(mediaItem: item)
                                    .padding(.leading)
                            }
                        })
                    }
                    
                    Spacer()
                }
            }
            .padding(.top, 5)
        }
        .padding(.top, 8)
    }
}
