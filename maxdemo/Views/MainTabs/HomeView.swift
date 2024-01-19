//
//  HomeView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @State var barOpacity: CGFloat = 0
    var body: some View {
        ZStack {
            ScrollView {
                // Use this to get the fade in of the top bar
                GeometryReader { g -> AnyView in
                    let rect = g.frame(in: .global)
                    DispatchQueue.main.async {
                        self.barOpacity = (500.0 - rect.maxY) / 500.0
                    }
                    return AnyView(CarouselView(items: mediaManager.getCarousel()))
                }
                .frame(height: 500)
                
                VStack {
                    HomeSectionView(section: mediaManager.getRecommendedForYou())
                    
                    HomeSectionView(section: mediaManager.getContinueWatching())
                    
                    TopItemsSectionView(section: mediaManager.getTopSeries())
                    
                    TopItemsSectionView(section: mediaManager.getTopMovies())
                    
                    Spacer()
                }
            }
            .ignoresSafeArea(edges: .top)
            .background(
                LinearGradient(colors: [.black, .black, .black, Color("darkblue")], startPoint: .top, endPoint: .bottom))
            
            
            VStack {
                HeaderView(opacity: $barOpacity)
                Spacer()
            }
            
        }
    }
}
