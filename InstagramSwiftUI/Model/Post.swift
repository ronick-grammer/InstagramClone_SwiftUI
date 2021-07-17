//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/17.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable{
    @DocumentID var id: String?
    let ownerUid: String
    let onwerUsername: String // 아.. 타이핑 잘못했다..
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
}
