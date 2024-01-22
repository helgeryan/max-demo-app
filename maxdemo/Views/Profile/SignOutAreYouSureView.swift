//
//  SignOutAreYouSureView.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/20/24.
//

import SwiftUI

struct AreYouSureView: View {
    @Binding var isPresented: Bool
    let prompt: String
    var confirmationText: String = "Confirm"
    var cancelText: String = "Cancel"
    var cancelAction: (() -> ())? = nil
    let confirmationAction: () -> ()
    var body: some View {
        VStack(alignment: .leading) {
            Text(prompt)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.white)
                .padding()
            
            FlexButton(text: confirmationText, backgroundColor: .white, foregroundColor: .black, action: {
                isPresented = false
                confirmationAction()
            })
            .padding(.horizontal)
            
            FlexButton(text: cancelText, backgroundColor: .edit, foregroundColor: .white, action: {
                if let cancelAction = cancelAction {
                    cancelAction()
                }
                isPresented = false
            })
            .padding(.horizontal)
        }
        .padding()
        .background(Color.darkGray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .clipped()
    }
}

