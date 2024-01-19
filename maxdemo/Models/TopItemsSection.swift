//
//  TopItemSection.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

struct TopItemsSection {
    let type: MediaType
    let items: [TopItem]
}

struct TopItem: Hashable {
    let index: Int
    let item: MediaItem
}
