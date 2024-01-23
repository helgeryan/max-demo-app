//
//  DeviceInfoView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct DeviceInfoView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    let platform = UIDevice.current.model
                    InfoLabelView(label: "Platform", value: platform)
                        .padding(.top)
                    
                    let brand = "Apple"
                    InfoLabelView(label: "Device Brand", value: brand)
                        .padding(.top)
                    
                    let manufacturer = "Apple"
                    InfoLabelView(label: "DeviceManufacturer", value: manufacturer)
                        .padding(.top)
                    
                    let model = UIDevice.current.model
                    InfoLabelView(label: "Device Model", value: model)
                        .padding(.top)
                    
                    let os = UIDevice.current.systemVersion
                    InfoLabelView(label: "Device OS Version", value: os)
                        .padding(.top)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .modifier(GradientBackground())
    }
}

struct InfoLabelView: View {
    let label: String
    let value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.white)
            Text(value)
                .font(.system(size: 12, weight: .regular))
                .padding(.top, 6)
                .foregroundStyle(.white)
        }
    }
}
