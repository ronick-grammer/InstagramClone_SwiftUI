//
//  CommentView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/21.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack {
            // comment cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0 ..< 10) { _ in
                        CommentCell()
                    }
                }
            }.padding(.top)
            // input view
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
