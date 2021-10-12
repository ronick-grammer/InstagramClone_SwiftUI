//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/26.
//

import UIKit


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
