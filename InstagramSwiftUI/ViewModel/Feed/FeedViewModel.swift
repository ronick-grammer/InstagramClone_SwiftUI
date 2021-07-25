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
        
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            //print(self.posts.count)
        }
    }
}

