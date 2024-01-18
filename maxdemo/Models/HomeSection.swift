//
//  HomeSection.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

struct HomeSection {
    let title: String
    let items: [MediaItem]
    let type: HomeSectionType
}

enum HomeSectionType {
    case general
    case watching
}
