//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
        
    var posts: [Post] {
        return viewModel.posts
    }
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 32) {
                ForEach(posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
