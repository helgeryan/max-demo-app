//
//  MainTabView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTabIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            MaxNavigationView(content: AnyView(HomeView()))
                .tabItem({
                    VStack {
                        Spacer()
                        Image(systemName: "house")
                        Spacer()
                    }
                })
                .tag(0)
            
            HomeView()
                .tabItem({
                    VStack {
                        Spacer()
                        Image(systemName: "bookmark")
                        Spacer()
                    }
                })
                .tag(1)
            
            HomeView()
                .tabItem({
                    VStack {
                        Spacer()
                        Image(systemName: "arrow.down.to.line")
                        Spacer()
                    }
                })
                .tag(1)
            
            HomeView()
                .tabItem({
                    VStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                        Spacer()
                    }
                })
                .tag(1)
        }
        .tint(.white)
    }
}
