//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/19.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId ).collection("post-likes")
            .document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).setData([:]) { _ in
                        self.post.didLike = true
                        self.post.likes += 1
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes])
                    }
        }
    }
    
    func unlike() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).delete { _ in
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).delete { _ in
                        self.post.didLike = false
                        self.post.likes -= 1
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes])
                    }
            }
    }
    
    func checkIfUserLikedPost() {
        
    }
}
