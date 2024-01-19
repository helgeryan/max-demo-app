//
//  HeaderView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @Binding var opacity: CGFloat
    var body: some View {
        HStack(spacing: 0) {
            Image("max", bundle: nil)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 20)
                .foregroundStyle(.white)
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
