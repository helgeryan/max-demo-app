//
//  maxdemoApp.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

@main
struct maxdemoApp: App {
    @StateObject var mediaManager: MediaManager = .init()
    @StateObject var profileManager: ProfileManager = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mediaManager)
                .environmentObject(profileManager)
        }
    }
}
