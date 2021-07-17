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
            /*
            documents.forEach { snapshot in
                guard let post = try? snapshot.data(as: Post.self) else {
                    print("DEBUG: Failed to fetch..")
                    return
                }
                
                self.posts.append(post)
                print("DEBUG: Fetched Post..")
                print(post.id ?? "")
            }
             */
            print("DEBUG: succeeded fetching")
            print(self.posts.count)
        }
    }
}

