//
//  PrivacyView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct PrivacyView: View {

    var body: some View {
        let settingsMenuItems: [SettingsMenuItem] = [
            .init(text: "Privacy Policy", isPush: false, action: {
                
            }),
            .init(text: "Terms of Use", isPush: false, action: {
                
            }),
            .init(text: "Ad Choices", isPush: false, action: {
                
            }),
        ]
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(settingsMenuItems, id: \.id) { item in
                        Button {
                            debugPrint("Doing \(item.text)")
                        } label: {
                            HStack {
                                Text(item.text)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(12)
                                
                                Spacer()
                                
                                if item.isPush {
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .frame(width: 20, height: 20)
                                        .padding(12)
                                }
                            }
                        }
                        
                        if item.id != settingsMenuItems.last?.id {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .background(Color("profilesettingscolor"))
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .clipped()
                .padding([.horizontal, .top])
                
                HStack {
                    let deviceID = UIDevice.current.identifierForVendor!.uuidString
                    let build = "36"
                    Text("Device ID: \(deviceID)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            
            Spacer()
        }
        .modifier(GradientBackground())
    }
}

#Preview {
    PrivacyView()
}
