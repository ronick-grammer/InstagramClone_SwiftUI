//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/08/02.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserDate(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio" : bio]) { _ in
            self.user.bio = bio // 꼭 가장 앞에 놓을것. 그렇지 않으면 작동 반영 X
            self.uploadComplete = true
            //print("Successfully saved user data.. \(self.uploadComplete)")
            
        }
    }
}
