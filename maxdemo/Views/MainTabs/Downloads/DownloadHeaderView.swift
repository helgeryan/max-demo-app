//
//  DownloadHeaderView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct DownloadHeaderView: View {
    @State var isProfilePresented: Bool = false
    var opacity: CGFloat = 1
    var body: some View {
        HStack(spacing: 0) {
            Text("Downloads")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .padding()
            Spacer()
            
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

#Preview {
    DownloadHeaderView()
}
