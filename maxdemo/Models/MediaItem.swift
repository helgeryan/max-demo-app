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
    var mediaType: MediaType = .series
    var isNew: Bool = true
    var currentEpisode: Int? = 1
    var currentSeason: Int? = 3
    var link: String = "https://play.max.com/show/dd81fcb3-4d2c-4abb-9c97-88355f4978e1?utm_medium=sharebutton&utm_id=E92E8A6F-208E-48AC-8F65-DCF052D94B15"

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
