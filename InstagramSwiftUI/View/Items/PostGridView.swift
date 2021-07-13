//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/25.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    // 도데체 뭐야
    //....
    var body: some View {
        LazyVGrid(columns: items, spacing: 3, content: {
            
            ForEach(0 ..< 10 ) { _ in
                NavigationLink(
                    destination: FeedView(),
                    label: {
                        Image("spiderman")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                            .clipped()
                    })
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
