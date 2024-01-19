//
//  Account.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

struct Account {
    var profiles: [Profile]
}

struct Profile: Equatable {
    let id: String = UUID().uuidString
    let name: String
    let profileImage: String?
}
