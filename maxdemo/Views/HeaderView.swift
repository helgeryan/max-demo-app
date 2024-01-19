//
//  HeaderView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @State var isProfilePresented: Bool = false
    @State var isUpdatesPresented: Bool = false
    @Binding var opacity: CGFloat
    var body: some View {
        HStack(spacing: 0) {
            Image("max", bundle: nil)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundStyle(.white)
                .padding()
            Spacer()
            Button {
                isUpdatesPresented = true
            } label: {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
            }
            .fullScreenCover(isPresented: $isUpdatesPresented, content: UpdatesView.init)
            
            Button {
                isProfilePresented = true
            } label: {
                Image("profile")
                    .resizable()
                    .foregroundStyle(.gray)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .fullScreenCover(isPresented: $isProfilePresented, content: AccountView.init)
        }
        .background(.black.opacity(opacity))
    }
}
