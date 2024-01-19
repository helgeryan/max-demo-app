//
//  DownloadsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct DownloadPageOption: Hashable {
    let text: String
    let index: Int
}

struct DownloadsView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @State var selectedIndex: Int = 0
    var body: some View {
        VStack {
            DownloadsHeaderView()
            DownloadOptionsView(selectedIndex: $selectedIndex)
                .padding()
            
            ScrollView {
                switch selectedIndex {
                case 0:
                    MyListView()
                default:
                    DownloadContinueWatchingView()
                }
                
                HomeSectionView(section: mediaManager.getRecommendedForYou())
                    .padding(.vertical)
            }
        }
        .modifier(GradientBackground())
    }
}


struct DownloadOptionsView: View {
    @Binding var selectedIndex: Int
    var options: [DownloadPageOption] = [
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
                        }
                        .frame(width: 160)
                    }
                }
                Spacer()
            }
        }
        .frame(height: 40)
        
    }
}

struct DownloadsHeaderView: View {
    var opacity: CGFloat = 1
    var body: some View {
        HStack(spacing: 0) {
            Text("My Stuff")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .padding()
            Spacer()
            NavigationLink(value: NavigationType.updates, label: {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
            })
            NavigationLink(value: NavigationType.profile, label: {
                Image("profile")
                    .resizable()
                    .foregroundStyle(.gray)
                    .frame(width: 25, height: 25)
                    .padding()
            })
        }
        .background(.black.opacity(opacity))
    }
}
struct GradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(colors: [.black, .black, .black, Color("darkblue")], startPoint: .top, endPoint: .bottom)
            )
    }
}
