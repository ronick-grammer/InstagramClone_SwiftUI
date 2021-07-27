//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/15.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        fetchUserStats()
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            // 팔로우하면 상대에게 알림
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            
            self.user.isFollowed = true
            //print("Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
        //print("DEBUG: unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return } // 본인이면 리턴
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStats() { // 유저의 포스트, 팔로우, 팔로워 수 업데이트
        guard let uid = user.id else { return }
    
        COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
            guard let followers = snapshot?.documents.count else { return }

            COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
                guard let following = snapshot?.documents.count else { return }
        
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _user in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user.stats = UserStats(postCount: posts, followerCount: followers, followingCount: following)
                }
            }
        }
    }
    
    /*
    func fetchUserStats() { // 이거 도대체 왜 안되는 거지같네..
        guard let uid = user.id else { return }
        var followerCount = 11, followingCount = 11, postCount = 11
    
        COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
            guard let followers = snapshot?.documents.count else { return }
            followerCount = followers
        }
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            followingCount = following
        }
        
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _user in
            guard let posts = snapshot?.documents.count else { return }
            postCount = posts
            print("DEBUG \(posts) \(postCount)")
        }
        self.user.stats = UserStats(postCount: postCount, followerCount: followerCount, followingCount: followingCount)
    }
 */
}
