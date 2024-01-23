//
//  MaxNavigationLink.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct MaxNavigationLink: View {
    let text: String
    let navigationValue: NavigationType
    var body: some View {
        NavigationLink(value: navigationValue, label: {
            HStack {
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(12)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 15, height: 15)
                    .padding(12)
            }
            .background(Color.profileSettings)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .clipped()
        })
    }
}

