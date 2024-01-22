//
//  MaxEditTextField.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/22/24.
//

import SwiftUI

struct MaxEditTextField: View {
    var prompt: String = "Email"
    var value: String
    var isSecureField: Bool = false
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            HStack {
                Text(prompt)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                NavigationLink(value: NavigationType.accountDetails, label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.white)
                })
            }
            
            let valueText = isSecureField ? value.replacingOccurrences(of: value, with: "**********") : value
            
            Text(valueText)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white)
                .padding(.top)
        
        }
    }
}

