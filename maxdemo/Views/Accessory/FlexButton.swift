//
//  FlexButton.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct FlexButton: View {
    let text: String
    var backgroundColor: Color = .white
    var foregroundColor: Color = .black
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.system(size: 15, weight: .bold))
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
        }
        .foregroundStyle(foregroundColor)
    }
}
