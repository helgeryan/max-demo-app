//
//  DownloadSettingsView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/23/24.
//

import SwiftUI

struct DownloadSettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            UpdatesTopBar(title: "Download Settings", dismissAction: {
                dismiss()
            })
            
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Storage on this device")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                            .padding([.horizontal, .top])
                        
                        GeometryReader { geometry in
                            HStack(spacing: 0) {
                                let totalDeviceSpace = UIDevice.current.totalDiskSpaceInBytes
                                let usedDeviceSpace = UIDevice.current.usedDiskSpaceInBytes
                                let freeSpace = UIDevice.current.freeDiskSpaceInBytes
                                let w1: CGFloat =  geometry.size.width * CGFloat(usedDeviceSpace) / CGFloat(totalDeviceSpace)
                                let w2: CGFloat =  geometry.size.width * CGFloat(freeSpace) / CGFloat(totalDeviceSpace)
                                let w3: CGFloat =  0.0//geometry.size.width / 3.0
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(width: w1, height: 5)
                                Rectangle()
                                    .foregroundStyle(Color.blue)
                                    .frame(width: w3, height: 5)
                                Rectangle()
                                    .foregroundStyle(Color.edit)
                                    .frame(width: w2, height: 5)
                            }
                        }
                        .padding([.horizontal, .top])
                        
                        HStack {
                            HStack {
                                Color.white.frame(width: 6, height: 6)
                                Text("USED")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                            
                            HStack {
                                Color.blue.frame(width: 6, height: 6)
                                Image("max")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            HStack {
                                Color.gray.frame(width: 6, height: 6)
                                Text("FREE")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding()
                    }
                    .background(Color.profileSettings)
                }
                .padding()
            }
        }
        .modifier(GradientBackground())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DownloadSettingsView()
}
