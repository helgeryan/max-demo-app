//
//  ContentView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI


struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(.darkGray)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().barTintColor = .clear
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor(Color.white)
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navAppearance
    }
    
    @EnvironmentObject var profileManager: ProfileManager
    
    var body: some View {
        if profileManager.account == nil {
            WelcomeView()
        } else {
            MainTabView()
        }
    }
}


