//
//  NotificationCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/23.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
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
    
    func fetchNotificationPost() {
        
    }
}
