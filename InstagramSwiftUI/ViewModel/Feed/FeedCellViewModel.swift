//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/19.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = (post.likes > 1) ? "likes" : "like"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        fetchPostUser()
        checkIfUserLikedPost()
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
                        
                        // 좋아요 누르면 상대에게 알림
                        NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                    }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return } // 음수 되는거 방지
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
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).getDocument { snapshot, _ in
                guard let didLiked = snapshot?.exists else { return }
                self.post.didLike = didLiked
            }
    }
    
    func fetchPostUser() {
        COLLECTION_USERS.document(post.ownerUid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.post.user = user
        }
    }
}
