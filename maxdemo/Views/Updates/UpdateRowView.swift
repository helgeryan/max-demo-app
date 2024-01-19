//
//  UpdateRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct UpdateRowView: View {
    var update: Update
    var body: some View {
        NavigationLink(value: update.item, label: {
            HStack(spacing: 0) {
                Image(update.item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 90)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(update.title)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 14, weight: .bold))
                    
                    Text(update.description)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 12, weight: .regular))
                    
                    Text("Watch Now")
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .font(.system(size: 12, weight: .regular))
                }
                .padding()
                
                Spacer()
                
                Button {
                    debugPrint("Do action items")
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                        .padding(5)
                }
                .shadow(radius: 10)
            }
        })
    }
}
