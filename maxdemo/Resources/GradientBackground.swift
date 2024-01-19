//
//  GradientBackground.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct GradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.black, .black, .black, Color("darkblue")], startPoint: .top, endPoint: .bottom)
            )
    }
}
