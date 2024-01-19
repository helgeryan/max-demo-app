//
//  DownloadsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MyStuffPageOption: Hashable {
    let text: String
    let index: Int
}

struct MyStuffView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @State var selectedIndex: Int = 0
    var body: some View {
        VStack {
            MyStuffHeaderView()
            MyStuffOptionsView(selectedIndex: $selectedIndex)
                .padding()
            
            ScrollView {
                switch selectedIndex {
                case 0:
                    MyListView()
                default:
                    MyStuffContinueWatchingView()
                }
                
                HomeSectionView(section: mediaManager.getRecommendedForYou())
                    .padding(.vertical)
            }
        }
        .modifier(GradientBackground())
    }
}
