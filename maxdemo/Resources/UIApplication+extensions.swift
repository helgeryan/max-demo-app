//
//  UIApplication+extensions.swift
//  maxdemo
//
//  Created by Ryan Helgeson on 1/19/24.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
