//
//  DevicesView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct DevicesView: View {
    var body: some View {
        VStack {
            Text("Lost of stolen device? To protect your account, change your password before signing out.")
                .foregroundStyle(.white)
                .padding()
            Spacer()
        }
        .navigationTitle("Manage Devices")
        .modifier(GradientBackground())
    }
}
