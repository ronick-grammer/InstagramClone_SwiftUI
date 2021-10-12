//
//  User.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/09.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable { //Decodable: json 키값과 일치하는 변수에 json value를 초기화 시켜주는 프로토콜
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    
    @DocumentID var id: String? // 파이어베이스의 documentId, 즉, uid
    var bio: String?
    
    var stats: UserStats?
    var isFollowed: Bool? = false
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id } // 현재 로그인한 유저인지 아닌지 확인
}

struct UserStats: Decodable {
    var postCount: Int
    var followerCount: Int
    var followingCount: Int
}
