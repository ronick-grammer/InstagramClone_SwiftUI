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
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
            //print("Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        print("DEBUG: unfollow user..")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
