//
//  FeedViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/17.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        let query = COLLECTION_POSTS.order(by: "timestamp", descending: true) // 시간 순으로 포스ㅡ트 보여주기
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            //print(self.posts.count)
            print("DEBUG: did fetch posts..")
        }
    }
}

