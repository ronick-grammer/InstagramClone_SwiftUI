//
//  DownloadViewPostModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/17.
//

import SwiftUI
import Firebase

struct DownloadViewPostModel: ObservableObject {
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: UploadType.post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "onwerUsername": user.username] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
    
    func downloadPost(postId: String)
}
