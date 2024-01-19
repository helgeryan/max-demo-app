//
//  MyStuffHeaderView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MyStuffHeaderView: View {
    var opacity: CGFloat = 1
    var body: some View {
        HStack(spacing: 0) {
            Text("My Stuff")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .padding()
            Spacer()
            NavigationLink(value: NavigationType.updates, label: {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
            })
            NavigationLink(value: NavigationType.profile, label: {
                Image("profile")
                    .resizable()
                    .foregroundStyle(.gray)
                    .frame(width: 25, height: 25)
                    .padding()
            })
        }
        .background(.black.opacity(opacity))
    }
}
