//
//  ProfileManager.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation


class ProfileManager: ObservableObject {
    @Published var account: Account? = nil
    @Published var selectedProfile: Profile = .init(name: "Taryn", profileImage: nil)
    
    func signIn() {
        account = Account(
            profiles: [
                .init(name: "Taryn", profileImage: nil),
                .init(name: "Mom", profileImage: nil),
                .init(name: "Ryan", profileImage: nil),
                .init(name: "Jord", profileImage: nil)
            ])
    }
    
    func signOut() {
        account = nil
    }
}
