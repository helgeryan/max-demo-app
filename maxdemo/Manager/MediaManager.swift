//
//  MovieManager.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation


class MediaManager: ObservableObject {
    @Published var items: [MediaItem] = [
        .init(title: "South Park", imageName: "southpark", shortDescription: "South Park is an American animated sitcom created by Trey Parker and Matt Stone and developed by Brian Graden for Comedy Central.", secondaryImage: "southpark2"),
        .init(title: "House of Dragons", imageName: "houseofdragons", shortDescription: "House of the Dragon is an American fantasy drama television series created by George R. R. Martin and Ryan Condal for HBO.", secondaryImage: "houseofdragons2"),
        .init(title: "Game of Thrones", imageName: "gameofthrones", shortDescription: "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO.", secondaryImage: "gameofthrones2"),
        .init(title: "Peacemaker", imageName: "peacemaker", shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2"),
        .init(title: "Hard Knocks: Miami Dolphins", imageName: "hardknocks", shortDescription: "As the 2023 NFL season continues at a pace, stay up to speed with the Miami Dolphins with an all-access look at the mid-season exploits of Mike McDaniel's team.", secondaryImage: ""),
        .init(title: "Barbie", imageName: "barbie", shortDescription: "", secondaryImage: "", mediaType: .movie),
        .init(title: "Ted 2", imageName: "ted2", shortDescription: "", secondaryImage: "", mediaType: .movie),
        .init(title: "Dune", imageName: "dune", shortDescription: "", secondaryImage: "", mediaType: .movie),
        .init(title: "Mad Max", imageName: "madmax", shortDescription: "", secondaryImage: "", mediaType: .movie)
    ]
    
    func getCarousel() -> [CarouselItem] {
        return items.filter({ return !$0.secondaryImage.isEmpty}).enumerated().map({ return .init(media: $1, index: $0)})
    }
    
    func getRecommendedForYou() -> HomeSection {
        return HomeSection(title: "Recommended For You", items: items, type: .general)
    }
    
    func getContinueWatching() -> HomeSection {
        return HomeSection(title: "Continue Watching", items: items, type: .watching)
    }
    
    func getTopSeries() -> TopItemsSection {
        let topItems: [TopItem] = items.filter({ return $0.mediaType == .series}).enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .series, items: Array(topItems.prefix(10)))
    }
    
    func getTopMovies() -> TopItemsSection {
        let topItems: [TopItem] = items.filter({ return $0.mediaType == .movie }).enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .movie, items: Array(topItems.prefix(10)))
    }
    
    
    func getMyList() -> [MediaItem] {
        return [ items[0] ]
    }
    
    func getSearchResults(queryText: String) -> [MediaItem] {
        return items.filter({ return $0.title.lowercased().contains(queryText.lowercased()) })
        
    }
    
    func getUpdates() -> [Update] {
        return items.map({ return .init(item: $0, title: "The Story Continues", description: "Don't miss the latest episode!") })
        
    }
}
