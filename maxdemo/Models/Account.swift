//
//  Account.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

struct Account {
    let name: String = "Ryan Helgeson"
    let email: String = "rh@gmail.com"
    let password: String = "123456789"
    var profiles: [Profile]
    var devices: [Device]
}

struct Profile: Equatable {
    let id: String = UUID().uuidString
    let name: String
    let profileImage: String?
}
