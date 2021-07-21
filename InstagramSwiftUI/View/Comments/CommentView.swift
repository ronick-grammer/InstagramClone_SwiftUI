//
//  CommentView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/21.
//

import SwiftUI

struct CommentView: View {
    @State var commentText = ""
    
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
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
