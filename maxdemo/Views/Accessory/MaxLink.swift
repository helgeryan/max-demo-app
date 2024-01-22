//
//  MaxLink.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct MaxLink: View {
    let urlString: String
    let text: String
    var body: some View {
        Link(destination: URL(string: urlString)!, label: {
            Text(text)
                .foregroundStyle(.blue)
                .font(.system(size: 14, weight: .regular))
        })
    }
}
