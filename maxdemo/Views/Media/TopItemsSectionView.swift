//
//  TopItemSectionView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//


import Foundation
import SwiftUI

struct TopItemsSectionView: View {
    var section: TopItemsSection
    var body: some View {
        VStack(spacing: 0) {
            Image(section.type == .movie ? "topmovies" : "topseries")
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(section.items, id: \.index) { item in
                        NavigationLink(value: item, label: {
                            TopItemRowView(topItem: item)
                                .padding(.leading)
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
