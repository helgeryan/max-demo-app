//
//  PrivacyView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import SwiftUI

struct PrivacySettingItem {
    let id: String = UUID().uuidString
    let text: String
    let url: String
}

struct PrivacyView: View {

    var body: some View {
        let settingsMenuItems: [PrivacySettingItem] = [
            .init(text: "Privacy Policy", url: "https://www.max.com/privacy?utm_source=vanity_url&utm_campaign=privacy_concent&utm_medium=product&_branch_referrer=H4sIAAAAAAAAA8soKSkottLXz8nMyy7Wy02s0EvOz9VP1S8oyixLTK4EAFnLrMIfAAAA&%24web_only=true&_branch_match_id=1153532637770860486"),
            .init(text: "Terms of Use", url: "https://www.max.com/terms-of-use?utm_source=vanity_url&utm_campaign=privacy_concent&utm_medium=product&_branch_referrer=H4sIAAAAAAAAA8soKSkottLXz8nMyy7Wy02s0EvOz9VP1S9JLcotBgBjNoSSHQAAAA%3D%3D&%24web_only=true&_branch_match_id=1153532637770860486"),
            .init(text: "Ad Choices", url: "https://www.warnermediaprivacy.com/opt-out/?utm_source=vanity_url&utm_campaign=privacy_concent&utm_medium=product&_branch_referrer=H4sIAAAAAAAAA8soKSkottLXz8nMyy7Wy02s0EvOz9VP1U9M0U3OyM9MTi0GALGiNM0iAAAA&%24web_only=true&_branch_match_id=1153532637770860486"),
        ]
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(settingsMenuItems, id: \.text) { item in
                        Link(destination: URL(string: item.url)!, label: {
                            HStack {
                                Text(item.text)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(12)
                                Spacer()
                            }
                        })
                        
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
