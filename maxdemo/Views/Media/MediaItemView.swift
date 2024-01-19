//
//  MediaItemView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MediaItemView: View {
    @Environment(\.dismiss) var dismiss
    @State var barOpacity: CGFloat = 0
    var mediaItem: MediaItem
    
    var body: some View {
        ZStack {
            ScrollView {
                // Use this to get the fade in of the top bar
                GeometryReader { g -> AnyView in
                    let rect = g.frame(in: .global)
                    DispatchQueue.main.async {
                        self.barOpacity = (500.0 - rect.maxY) / 500.0
                    }
                    return AnyView(MediaHeaderView(item: mediaItem))
                }
                .frame(height: 500)
                
                VStack {
                    
                }
            }
            .ignoresSafeArea(edges: .top)
            
            VStack {
                MediaItemTopBar(opacity: $barOpacity, title: mediaItem.title, dismissAction: {
                    dismiss()
                })
                Spacer()
            }
        }
        .modifier(GradientBackground())
        .navigationBarBackButtonHidden(true)
    }
}

struct MediaHeaderView: View {
    let item: MediaItem
    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: .fullScreenWidth, height: 500)
                .clipped()
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(1)]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                
                Image(item.secondaryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.bottom)
                
                Text(item.shortDescription)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .padding(.bottom, 40)
                    .padding(.horizontal)
            }
        }
    }
}


struct MediaItemTopBar: View {
    @Binding var opacity: CGFloat
    var title: String
    var dismissAction: () -> ()
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .opacity(opacity)
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
        .background(.black.opacity(opacity))
    }
}
