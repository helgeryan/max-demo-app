//
//  CarouselItem.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

struct MediaItem: Hashable {
    let title: String
    let imageName: String
    let shortDescription: String
    let secondaryImage: String
    var tvRating: String = "TV-MA"
    var mediaType: MediaType = .movie
    var isNew: Bool = true
    var currentEpisode: Int? = 1
    var currentSeason: Int? = 3

    var isCurrentlyWatching: Bool {
        return currentSeason != nil && currentSeason != nil
    }
    
    var seasonEpisodeString: AttributedString {
        var title = AttributedString(title)
        title.font = .headline
        title.foregroundColor = .white
        
        var seasonEpisode =  AttributedString(" S\(currentSeason ?? 0)E\(currentEpisode ?? 0)")
        seasonEpisode.font = .caption2
        seasonEpisode.foregroundColor = .gray
        
        return title + seasonEpisode
    }
}

enum MediaType {
    case movie
    case series
}
