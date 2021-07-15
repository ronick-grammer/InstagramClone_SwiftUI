//
//  UserService.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/15.
//

import Firebase

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // 현재 로그인 유저의 팔로잉 리스트를 업데이트하고 팔로잉하는 유저의 팔로워 리스트도 업데이트한다.데헷
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).setData([:]) { _ in
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow() {
        
    }
    
    static func checkIfUserFollowed() {
        
    }
}
