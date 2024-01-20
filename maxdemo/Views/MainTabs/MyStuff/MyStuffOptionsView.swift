//
//  MyStuffOptionsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MyStuffOptionsView: View {
    @Binding var selectedIndex: Int
    var options: [MyStuffPageOption] = [
        .init(text: "My List", index: 0),
        .init(text: "Continue Watching", index: 1)
        
    ]
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.gray)
            }
            
            HStack {
                ForEach(options, id: \.self) { option in
                    Button {
                        withAnimation {
                            selectedIndex = option.index
                        }
                    } label: {
                        VStack {
                            Spacer()
                            Text(option.text)
                                .foregroundStyle(.white)
                                .font(.system(size: 18, weight: .regular))
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(.white)
                                    .opacity(selectedIndex == option.index ? 1 : 0)
                        }.fixedSize()
                    }.padding(.trailing)
                }
                Spacer()
            }
        }
        .frame(height: 40)
        
    }
}
