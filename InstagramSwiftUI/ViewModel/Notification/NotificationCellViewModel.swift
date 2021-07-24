//
//  NotificationCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/23.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    @Published var post: Post? // 팔로우 했을 경우 포스트는 필요없으므로 옵셔널
    @Published var user: User?
    
    init(notification: Notification) {
        self.notification = notification
        fetchUser()
        fetchNotificationPost()
        checkIfUserIsFollowed()
    }
    
    func follow() {
        let uid = notification.uid
        UserService.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return } // 상대가 자신을 팔로우 하고 있을때만
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.user = user
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId  else { return } // 팔로우 타입이면 바로 리턴
        
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            guard let post = try? snapshot?.data(as: Post.self) else { return }
            self.post = post
        }
    }
}
