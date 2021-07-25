//
//  CommentViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/21.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    private let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = ["username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "uid": user.id ?? "",
                                   "timestamp": Timestamp(date: Date()),
                                   "postOwnerUid": post.ownerUid,
                                   "commentText": commentText]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }
            
            // 코멘트 달았으면 상대에게 알림
            NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
    
    func fetchComments() {
        guard let postId = post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
        
        // 데이터가 추가될 때마다 실시간으로 뷰에 반영 (댓글이 실시간으로 달림)
        query.addSnapshotListener { snapshot, _ in
            // 추가된 데이터만 필터링
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
            
            //print("DEBUG: Successfully fetched comment")
        }
    }
}


