//
//  ProfileManager.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation

class ProfileManager: ObservableObject {
    
    @Published var account: Account? = Account(profiles: [
        .init(name: "Ryan", profileImage: nil),
        .init(name: "John", profileImage: nil),
        .init(name: "Jim", profileImage: nil),
        .init(name: "Jack", profileImage: nil)
    ], devices: [
        .init(type: .xbox),
        .init(type: .browser),
        .init(type: .roku),
        .init(type: .browser),
        .init(type: .browser),
        .init(type: .tv),
        .init(type: .xbox),
        .init(type: .browser),
        .init(type: .tv),
        .init(type: .browser),
        .init(type: .browser),
        .init(type: .roku),
        .init(type: .browser),
        
    ])
    @Published var selectedProfile: Profile? = nil
    
    func signIn() {
        let profiles: [Profile] = [
            .init(name: "Ryan", profileImage: nil),
            .init(name: "John", profileImage: nil),
            .init(name: "Jim", profileImage: nil),
            .init(name: "Jack", profileImage: nil)
        ]
        
        let devices: [Device] =  [
            .init(type: .xbox),
            .init(type: .browser),
            .init(type: .roku),
            .init(type: .browser),
            .init(type: .browser),
            .init(type: .tv),
            .init(type: .xbox),
            .init(type: .browser),
            .init(type: .tv),
            .init(type: .browser),
            .init(type: .browser),
            .init(type: .roku),
            .init(type: .browser),
            
        ]
        account = Account(profiles:profiles, devices: devices)
        selectedProfile = profiles[0]
    }
    
    func signOut() {
        account = nil
    }
    
    func signDevicesOut() {
        account?.devices = []
    }
}

