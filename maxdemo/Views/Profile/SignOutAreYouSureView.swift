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
            
            Button {
                debugPrint("Doing sign in")
                confirmationAction()
                isPresented = false
            } label: {
                Text(confirmationText)
                    .foregroundStyle(.black)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            }
            .padding(.horizontal)
            
            Button {
                debugPrint("Doing cancel")
                if let cancelAction = cancelAction {
                    cancelAction()
                }
                isPresented = false
            } label: {
                Text(cancelText)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.edit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.darkGray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .clipped()
    }
}

