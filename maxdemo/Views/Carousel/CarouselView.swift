//
//  CarouselView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation
import SwiftUI

struct CarouselView: View {
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()

    let items: [MediaItem] = [
        MediaItem(imageName: "southpark", index: 0, shortDescription: "South Park is an American animated sitcom created by Trey Parker and Matt Stone and developed by Brian Graden for Comedy Central.", secondaryImage: "southpark2"),
        MediaItem(imageName: "houseofdragons", index: 1, shortDescription: "House of the Dragon is an American fantasy drama television series created by George R. R. Martin and Ryan Condal for HBO.", secondaryImage: "houseofdragons2"),
        MediaItem(imageName: "gameofthrones", index: 2,  shortDescription: "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO.", secondaryImage: "gameofthrones2"),
        MediaItem(imageName: "peacemaker", index: 3, shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2")
    ]
    @State private var index = 0
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                TabView(selection: $index) {
                    ForEach(items, id: \.imageName) { carouselItem in
                        CarouselCardView(currentIndex: $index, carouselItem: carouselItem).tag(carouselItem.index)
                    }
                }
                .onReceive(timer, perform: { _ in
                    withAnimation {
                        if index == items.count - 1 {
                            index = 0
                        } else {
                            index = index + 1
                        }
                    }
                })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
        
        .frame(width: .fullScreenWidth,  height: 500)
    }
}


