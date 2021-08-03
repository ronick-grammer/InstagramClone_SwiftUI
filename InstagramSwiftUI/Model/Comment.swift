//
//  Comment.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    var timestampString: String? { // Decodable 프로토콜을 따르기 위해서 옵셔널
        return TimestampString.dateString(timestamp)
    }
}
