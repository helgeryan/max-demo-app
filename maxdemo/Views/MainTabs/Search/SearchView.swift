//
//  SearchView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var isTextFieldFocused: Bool = false
    @FocusState var focusState: Bool
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isTextFieldFocused ? .white : .gray)
                        .frame(width: 20, height: 20)
                    TextField("Find movies, shows, and more", text: $searchText)
                        .placeholder(when: searchText.isEmpty) {
                            Text("Find movies, shows, and more").foregroundColor(.gray)
                        }
                        .focused($focusState)
                        .foregroundStyle(isTextFieldFocused ? .white : .gray)
                        
                    Spacer()
                }
                .padding()
                .background(Color("editcolor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
                .onTapGesture {
                    withAnimation {
                        isTextFieldFocused.toggle()
                        focusState.toggle()
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .modifier(GradientBackground())
    }
}

#Preview {
    SearchView()
}
