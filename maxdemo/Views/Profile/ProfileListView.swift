//
//  ProfileListView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/20/24.
//

import SwiftUI

struct ProfilesListView: View {
    let account: Account
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(account.profiles, id: \.name) {  profile in
                    ProfileView(profile: profile)
                        .padding([.leading, .top])
                }
            }
        }
    }
}
