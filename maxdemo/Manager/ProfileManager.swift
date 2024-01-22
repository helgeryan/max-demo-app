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
    ])
    @Published var selectedProfile: Profile? = nil
    
    func signIn() {
        let profiles: [Profile] = [
            .init(name: "Ryan", profileImage: nil),
            .init(name: "John", profileImage: nil),
            .init(name: "Jim", profileImage: nil),
            .init(name: "Jack", profileImage: nil)
        ]
        account = Account(profiles:profiles)
        selectedProfile = profiles[0]
    }
    
    func signOut() {
        account = nil
    }
}
