//
//  SearchView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @State var searchText: String = ""
    @FocusState var focusState: Bool
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(focusState ? .white : .gray)
                        .frame(width: 20, height: 20)
                    TextField("Find movies, shows, and more", text: $searchText)
                        .placeholder(when: searchText.isEmpty) {
                            Text("Find movies, shows, and more").foregroundColor(.gray)
                        }
                        .focused($focusState)
                        .foregroundStyle(focusState ? .white : .gray)
                        
                    Spacer()
                }
                .padding()
                .background(focusState ? Color("focuscolor") : Color("editcolor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
                .onTapGesture {
                    withAnimation {
                        focusState.toggle()
                    }
                }
            }
            .padding()
            
            ScrollView {
                if !searchText.isEmpty {
                    VStack {
                        ForEach(mediaManager.getSearchResults(queryText: searchText), id: \.self) { item in
                            SearchRowView(mediaItem: item)
                                .padding([.top, .horizontal])
                        }
                    }
                } else {
                    HomeSectionView(section: mediaManager.getRecommendedForYou())
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            endEditing()
        }
        .modifier(GradientBackground())
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
    SearchView()
}
