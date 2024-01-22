//
//  DeviceRowView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct DeviceRowView: View {
    let device: Device
    var body: some View {
        HStack {
            VStack {
                Image(systemName: device.type.icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(device.type.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .bold))
                
                Text(getDateText(date: device.lastLoginDate))
                    .padding(.top, 4)
                    .foregroundStyle(.white)
                    .font(.system(size: 13, weight: .regular))
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                
                Text(device.location)
                    .padding(.top)
                    .foregroundStyle(.white)
                    .font(.system(size: 13, weight: .regular))
            }
            
            Spacer()
        }
    }
    
    func getDateText(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = .current
        
        return formatter.string(from: date)
    }
}
