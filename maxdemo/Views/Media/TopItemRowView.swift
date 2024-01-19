//
//  TopItemRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//
import SwiftUI

struct TopItemRowView: View {
    var topItem: TopItem
    var width: CGFloat = 90
    var height: CGFloat = 140
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Spacer()
                Image("\(topItem.index + 1)")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 60)
            
            ZStack {
                Image(topItem.item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                
                HStack {
                    Spacer()
                    VStack {
                        MediaMenuButton(item: topItem.item)
                        Spacer()
                    }
                }
            }
            .frame(width: width, height: height)
            .clipped()
        }
    }
}
