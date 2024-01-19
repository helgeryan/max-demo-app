//
//  MediaItemView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/18/24.
//

import SwiftUI

struct MediaItemView: View {
    @EnvironmentObject var mediaManager: MediaManager
    @Environment(\.dismiss) var dismiss
    @State var isSharePresented: Bool = false
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
                
                VStack(alignment: .leading, spacing: 0) {
                    Button {
                        debugPrint("Doing play")
                    } label: {
                        Label("Watch Now", systemImage: "play.fill")
                            .foregroundStyle(.black)
                            .font(.system(size: 15, weight: .bold))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        let isFaved = mediaManager.myListItems.contains(mediaItem)
                        let image = isFaved ? "checkmark" : "plus"
                        MediaActionButton(text: "My List", systemImage: image, action: {
                            if isFaved {
                                mediaManager.myListItems = mediaManager.myListItems.filter({ return mediaItem != $0 })
                            } else {
                                mediaManager.myListItems.append(mediaItem)
                            }
                        })
                        .padding()
                        MediaActionButton(text: "Trailer", systemImage: "movieclapper", action: {
                            
                        })
                        .padding()
                        MediaActionButton(text: "Share", systemImage: "square.and.arrow.up", action: {
                            isSharePresented = true
                        })
                        .sheet(isPresented: $isSharePresented, content: {
                            ActivityViewController(activityItems: [URL(string: mediaItem.link)!])
                                .presentationDetents([.height(300)])
                        })
                        .padding()
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text(mediaItem.shortDescription)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.horizontal)
                    

                    HStack {
                        Text(mediaItem.tvRating)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 11, weight: .regular))
                            .padding(.horizontal)
                        Spacer()
                    }
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

struct MediaActionButton: View {
    let text: String
    let systemImage: String
    let action: () -> (Void)
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 0) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 22, height: 22)
                Text(text)
                    .padding(.top, 3)
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .regular))
            }
        }
    }
}
