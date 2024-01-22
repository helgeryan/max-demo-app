//
//  DevicesView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct DevicesView: View {
    @EnvironmentObject var profileManager: ProfileManager
    var body: some View {
        VStack {
            Text(getHeaderText())
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top)
            
            MaxLink(urlString: "https://help.max.com/US/Answer/Detail/000002509", text: "Learn More")
                .padding([.horizontal, .bottom])
            
            FlexButton(text: "Sign Out All Devices", action: {
                profileManager.signDevicesOut()
            })
            .padding()
            
            ScrollView {
                if let devices = profileManager.account?.devices, devices.count > 0 {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("This Device")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .bold))
                            .padding([.horizontal, .top])
                        VStack(alignment:.leading, spacing: 0) {
                            DeviceRowView(device: devices.first!)
                                .padding()
                        }
                        .background(Color.profileSettings)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .clipped()
                        .padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Other Devices (\(devices.count))")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .bold))
                            .padding([.horizontal, .top])
                        VStack(alignment:.leading, spacing: 0) {
                            ForEach(devices, id: \.id) { device in
                                DeviceRowView(device: device)
                                    .padding()
                                
                                if device != devices.last {
                                    Rectangle()
                                        .foregroundStyle(.white)
                                        .frame(height: 1)
                                }
                            }
                        }
                        .background(Color.profileSettings)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .clipped()
                        .padding()
                    }
                }
                
                
                Spacer()
            }
        }
        .navigationTitle("Manage Devices")
        .modifier(GradientBackground())
        
    }
    
    func getHeaderText() -> AttributedString {
        var boldText = AttributedString("Lost of stolen device?")
        boldText.font = .systemFont(ofSize: 13, weight: .bold)
        boldText.foregroundColor = .white
        
        var regularText =  AttributedString(" To protect your account, change your password before signing out.")
        regularText.font = .systemFont(ofSize: 12, weight: .regular)
        regularText.foregroundColor = .white
        
        return boldText + regularText
    }
}
