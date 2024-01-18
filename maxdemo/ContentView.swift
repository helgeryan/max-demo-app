//
//  ContentView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mediaManager: MediaManager
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        
                        CarouselView(items: mediaManager.getCarousel())
                        
                        HomeSectionView(section: mediaManager.getRecommendedForYou())
                        
                        HomeSectionView(section: mediaManager.getContinueWatching())
                        
                        TopItemsSectionView(section: mediaManager.getTopSeries())
                        
                        TopItemsSectionView(section: mediaManager.getTopMovies())
                        
                        Spacer()
                    }
                }
                .background(
                    LinearGradient(colors: [.black, .black, .black, Color("darkblue")], startPoint: .top, endPoint: .bottom))
                
                    
                VStack {
                    HeaderView()
                    Spacer()
                }
                
            }
        }
    }
}


