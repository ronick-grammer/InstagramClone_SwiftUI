//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/08/02.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    private let user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserDate(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio" : bio]) { _ in
            self.uploadComplete = true
            
            print("Successfully saved user data..")
        }
    }
}
