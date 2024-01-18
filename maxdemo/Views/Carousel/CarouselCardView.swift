//
//  CarouselCardView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import Foundation
import SwiftUI

struct CarouselCardView: View {
    @State var mainImageOpacity: CGFloat = 1.0
    @Binding var currentIndex: Int
    let carouselItem: CarouselItem
    var body: some View {
        ZStack {
            Image(carouselItem.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: .fullScreenWidth, height: 500)
                .clipped()
                .opacity(currentIndex == carouselItem.index ? 1 : 0)
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(1)]), startPoint: .top, endPoint: .bottom)
    
            VStack {
                Spacer()
                
                Image(carouselItem.secondaryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.bottom)
                
                Text(carouselItem.shortDescription)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .padding(.bottom, 40)
                    .padding(.horizontal)
                    
            }
        }
    }
}
