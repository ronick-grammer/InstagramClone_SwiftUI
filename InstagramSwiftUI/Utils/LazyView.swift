//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/30.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
