//
//  ProfileTopBar.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/20/24.
//

import SwiftUI

struct ProfileTopBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Button {
                dismiss()
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
}
