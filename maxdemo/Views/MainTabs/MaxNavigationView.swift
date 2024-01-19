//
//  MaxNavigationView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MaxNavigationView: View {
    let content: AnyView
    var body: some View {
        
        NavigationStack {
            content
                .navigationDestination(for: MediaItem.self, destination: { item in
                    MediaItemView(mediaItem: item)
                })
                .navigationDestination(for: TopItem.self, destination: { item in
                    MediaItemView(mediaItem: item.item)
                })
                .navigationDestination(for: NavigationType.self, destination: { type in
                    switch type {
                    case .profile:
                        AccountView()
                    case .updates:
                        UpdatesView()
                    }
                })
            
        }
            
    }
}
