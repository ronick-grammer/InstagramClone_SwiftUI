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
    let postId: String
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
}

// 각 type에 따른 notification 메시지
enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}
