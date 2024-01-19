//
//  MediaMenuButton.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct MediaMenuButton: View {
    @State var isPresented: Bool = false
    let item: MediaItem
    var body: some View {
        Button {
            isPresented = true
        } label: {
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(width: 20, height: 20)
                .padding(5)
        }
        .shadow(radius: 10)
        .sheet(isPresented: $isPresented) {
            MediaQuickLookView(item: item)
                .presentationDetents([.height(250)])
                .presentationDragIndicator(.visible)
        }
    }
}
