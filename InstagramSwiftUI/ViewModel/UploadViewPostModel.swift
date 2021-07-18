//
//  UploadViewPostModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/16.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: UploadType.post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "onwerUsername": user.username] as [String: Any] // 잘못 되었단걸 깨달았을때는 이미 많은 것이 업로드 되었지..feat.스펠링
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
