//
//  Device.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import Foundation

struct Device: Hashable {
    let id: String = UUID().uuidString
    let type: DeviceType
    let location: String = "US"
    let lastLoginDate: Date = Date()
}

enum DeviceType {
    case xbox
    case phone
    case browser
    case roku
    case tv
    
    var name: String {
        switch self {
        case .xbox:
            return "Xbox"
        case .phone:
            return "Phone"
        case .browser:
            return "Browser"
        case .roku:
            return "Roku"
        case .tv:
            return "TV"
        }
    }
    
    var icon: String {
        switch self {
        case .xbox:
            return "xbox.logo"
        case .phone:
            return "phone"
        case .browser:
            return "laptopcomputer"
        case .roku:
            return "mediastick"
        case .tv:
            return "tv"
        }
    }
}
