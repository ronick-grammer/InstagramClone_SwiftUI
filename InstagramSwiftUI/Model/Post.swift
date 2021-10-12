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
    let onwerUsername: String // ownerUsername 을 onwerUsername 으로 잘못 타이핑
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
    var user: User?
}
