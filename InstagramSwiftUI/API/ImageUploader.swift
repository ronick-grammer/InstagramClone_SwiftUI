//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/07.
//

import UIKit
import Firebase

struct ImageUploader {
    // 이미지 업로드가 끝나면(completion) 이미지 url 을 반환한다.
    // Swift UI Image는 JPEG 가 안되므로 UIImage로 받아야 한다.
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        // jpeg 사진 퀄리티를 조장한다. 사진 퀄리티는 사진 크기와 연관이 있으므로 크게 잡지 않는다.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        // 이미지의 고유한 식별문자열을 만든다. 인터넷에서 이미지의 주소를 보면 !@#$12SDFASf 식으로 보여지는 것처럼..
        let filename = NSUUID().uuidString
        
        // 파이어베이스 스토리지에 업로드할 사진의 url 주소를 지정한다.
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        // 이제 이미지를 업로드한다. 이미지 업로드에 성공하면 그 url 주소를 user 테이블에 저장해야한다.
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image...")
             
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
