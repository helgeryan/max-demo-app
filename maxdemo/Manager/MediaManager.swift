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
        .init(title: "Peacemaker", imageName: "peacemaker", shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2")
    ]
    
    func getCarousel() -> [CarouselItem] {
        return items.enumerated().map({ return .init(media: $1, index: $0)})
    }
    
    func getRecommendedForYou() -> HomeSection {
        return HomeSection(title: "Recommended For You", items: items, type: .general)
    }
    
    func getContinueWatching() -> HomeSection {
        return HomeSection(title: "Continue Watching", items: items, type: .watching)
    }
    
    func getTopSeries() -> TopItemsSection {
        let topItems: [TopItem] = items.enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .series, items: topItems)
    }
    
    func getTopMovies() -> TopItemsSection {
        let topItems: [TopItem] = items.enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .movie, items: topItems)
    }
    
    
    func getMyList() -> [MediaItem] {
        return [ items[0] ]
    }
    
    func getSearchResults(queryText: String) -> [MediaItem] {
        return items.filter({ return $0.title.lowercased().contains(queryText.lowercased()) })
        
    }
}
