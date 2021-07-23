//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/15.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        fetchProfilePosts()
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            // 팔로우하면 상대에게 알림
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            
            self.user.isFollowed = true
            print("Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
        //print("DEBUG: unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return } // 본인이면 리턴
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchProfilePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            // 로그인 유저의 포스트들만 저장
            guard let uid = self.user.id else { return }
            self.posts = posts.filter({ $0.ownerUid.contains(uid) })
        }
    }
}
