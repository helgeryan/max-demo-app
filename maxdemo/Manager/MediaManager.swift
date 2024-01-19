//
//  MovieManager.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation


class MediaManager: ObservableObject {
    @Published var items: [MediaItem] = [
        .init(title: "House of the Dragon", imageName: "houseofdragons", shortDescription: "House of the Dragon is an American fantasy drama television series created by George R. R. Martin and Ryan Condal for HBO.", secondaryImage: "houseofdragons2", link: "https://play.max.com/show/c68e69d7-9317-428a-a615-cdf8fe5a2e06"),
        .init(title: "Game of Thrones", imageName: "gameofthrones", shortDescription: "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO.", secondaryImage: "gameofthrones2", link: "https://play.max.com/show/4f6b4985-2dc9-4ab6-ac79-d60f0860b0ac"),
        .init(title: "Peacemaker", imageName: "peacemaker", shortDescription: "Peacemaker is an American superhero television series created by James Gunn for the streaming service HBO Max, based on the DC Comics character Peacemaker", secondaryImage: "peacemaker2", link: "https://play.max.com/show/a939d96b-7ffb-4481-96f6-472838d104ca"),
        .init(title: "Hard Knocks: Miami Dolphins", imageName: "hardknocks", shortDescription: "As the 2023 NFL season continues at a pace, stay up to speed with the Miami Dolphins with an all-access look at the mid-season exploits of Mike McDaniel's team.", secondaryImage: "hardknocks2"),
        .init(title: "Barbie", imageName: "barbie", shortDescription: "Barbie is a fashion doll created by American businesswoman Ruth Handler, manufactured by American toy and entertainment company Mattel and introduced on March 9, 1959.", secondaryImage: "barbie2", tvRating: "PG-13", mediaType: .movie, link: "https://play.max.com/movie/80bc4915-c826-499f-9961-b422b17559b6"),
        .init(title: "Ted 2", imageName: "ted2", shortDescription: "Ted 2 (stylized as ted2) is a 2015 American fantasy comedy film directed by Seth MacFarlane and written by MacFarlane, Alec Sulkin, and Wellesley Wild.", secondaryImage: "ted22", tvRating: "R", mediaType: .movie, link: "https://play.max.com/movie/81e67491-9f5e-40cf-874f-7c03b1091054"),
        .init(title: "Dune", imageName: "dune", shortDescription: "Dune (titled onscreen as Dune: Part One) is a 2021 American epic science fiction film directed by Denis Villeneuve, who co-wrote the screenplay with Jon Spaihts and Eric Roth. It is the first of a two-part adaptation of the 1965 novel of the same name from Frank Herbert's Dune franchise.", secondaryImage: "dune2", tvRating: "PG-13", mediaType: .movie, link: "https://play.max.com/movie/e7dc7b3a-a494-4ef1-8107-f4308aa6bbf7"),
        .init(title: "Mad Max", imageName: "madmax", shortDescription: "Mad Max is an Australian post-apocalyptic and dystopian action film series and media franchise created by George Miller and Byron Kennedy.", secondaryImage: "madmax2", tvRating: "R", mediaType: .movie, link: "https://play.max.com/movie/8cde025a-223d-4879-9336-3d5f6c9d0c55"),
        .init(title: "South Park", imageName: "southpark", shortDescription: "South Park is an American animated sitcom created by Trey Parker and Matt Stone and developed by Brian Graden for Comedy Central.", secondaryImage: "southpark2", link: "https://play.max.com/show/fd30a89f-173e-459a-a5bd-ad9748b7f07f"),
    ]
    
    
    @Published var myListItems: [MediaItem] = []
    
    func getCarousel() -> [CarouselItem] {
        return items.filter({ return !$0.secondaryImage.isEmpty}).enumerated().map({ return .init(media: $1, index: $0)})
    }
    
    func getRecommendedForYou() -> HomeSection {
        return HomeSection(title: "Recommended For You", items: items, type: .general)
    }
    
    func getContinueWatching() -> HomeSection {
        return HomeSection(title: "Continue Watching", items: items, type: .watching)
    }
    
    func getMyListSection() -> HomeSection {
        return HomeSection(title: "My List", items: myListItems, type: .general)
    }
    
    func getTopSeries() -> TopItemsSection {
        let topItems: [TopItem] = items.filter({ return $0.mediaType == .series}).enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .series, items: Array(topItems.prefix(10)))
    }
    
    func getTopMovies() -> TopItemsSection {
        let topItems: [TopItem] = items.filter({ return $0.mediaType == .movie }).enumerated().map({ return .init(index: $0, item: $1) })
        return .init(type: .movie, items: Array(topItems.prefix(10)))
    }
    
    func getSearchResults(queryText: String) -> [MediaItem] {
        return items.filter({ return $0.title.lowercased().contains(queryText.lowercased()) })
        
    }
    
    func getUpdates() -> [Update] {
        return items.map({ return .init(item: $0, title: "The Story Continues", description: "Don't miss the latest episode!") })
        
    }
}
