//
//  ActivityViewController.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        controller.completionWithItemsHandler = { activity, success, items, error in
            if let error = error {
                debugPrint("UIActivityError: \(error.localizedDescription)")
            }
            
            dismiss()
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
