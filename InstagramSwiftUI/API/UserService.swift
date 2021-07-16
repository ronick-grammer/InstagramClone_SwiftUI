//
//  UserService.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/15.
//

import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

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
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        // 현재 로그인 유저의 팔로잉 리스트에서 팔로우 했던 유저를 지우고 그 유저의 팔로워 리스트에서 자신도 지운다.
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).delete { _ in
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, competion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // 현재 로그인 유저가 해당 유저를 팔로우 하고 있는지 체크한다.
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).getDocument { snapshot, _ in
                // 데이터베이스상에서 해당 유저가 있으면(팔로우하고 있으면) true, 아니면 false
                guard let isFollowed = snapshot?.exists else { return }
                competion(isFollowed)
            }
    }
}
