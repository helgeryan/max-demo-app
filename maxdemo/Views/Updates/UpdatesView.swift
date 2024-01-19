//
//  UpdatesView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct UpdatesView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            UpdatesTopBar(title: "Updates", dismissAction: { dismiss() })
            Spacer()
        }
        .background(.black)
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
                    .font(.system(size: 14, weight: .bold))
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
