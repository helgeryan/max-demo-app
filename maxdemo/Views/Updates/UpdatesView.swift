//
//  UpdatesView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct UpdatesView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            UpdatesTopBar(title: "Updates", dismissAction: { dismiss() })
            
            ScrollView {
                VStack {
                    ForEach(mediaManager.getUpdates(), id: \.self) { update in
                        UpdateRowView(update: update)
                            .padding([.top, .horizontal])
                    }
                }
            }
            
            Spacer()
        }
        .modifier(GradientBackground())
        .navigationBarBackButtonHidden(true)
    }
}


struct UpdatesTopBar: View {
    var title: String
    var dismissAction: () -> ()
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }
            
            HStack {
                Button {
                    dismissAction()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
                .padding()
            
                Spacer()
            }
        }
        .background(.black)
    }
}
