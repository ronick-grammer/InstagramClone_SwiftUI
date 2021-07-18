//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/25.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 3, content: {
            
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: FeedView(),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
            }
        })
    }
}

/*
struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
*/
