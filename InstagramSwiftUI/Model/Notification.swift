//
//  Notification.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String? // 팔로우 알림이면 postId는 필요없다
    let username: String // 상대 유저이름
    let profileImageUrl: String // 상대 유저 프로필 이미지
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String // 상대 uid
    
    var isFollowed: Bool? = false
}

// 각 type에 따른 notification 메시지
enum NotificationType: Int, Decodable {
    case like  // 0
    case comment // 1
    case follow // 2
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}
