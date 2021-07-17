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
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
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
}
