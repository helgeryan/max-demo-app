//
//  ContentView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                
                CarouselView()
                
                
                Spacer()
            }
        }
        .background(
            LinearGradient(colors: [.black, Color("darkblue")], startPoint: .top, endPoint: .bottom))
    }
}


