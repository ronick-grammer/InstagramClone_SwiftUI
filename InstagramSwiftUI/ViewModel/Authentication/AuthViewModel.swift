//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/05.
//

import SwiftUI

import Firebase

// ObservableObject 프로토콜을 따르는 클래스나 구조체내에 있는 @Published 프로퍼티의 값에 변화가 생길때 마다
// 해당 프로퍼티를 참조하는 다른 뷰들에 있는 프로퍼티들도 값의 변화가 생길것이고 그로인해 그 뷰가 업데이트 된다.
class AuthViewModel: ObservableObject {
    // 유저가 생성되면 유저 세션은 nil이 아니게 된다.
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?,
                  fullname: String, username: String) {
        
        guard let image = image else { return } // 이미지 업로드 전에 이미지가 존재하는지 확인
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error { // 이메일 형식이 틀리거나 비밀번호 형식이 맞지 않으면 발생
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("Successfully registered user...")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                // 유저 데이터 저장
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    self.userSession = user // 세션 등록
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil  // 앱에서 로그아웃
        try? Auth.auth().signOut() // 파이어베이스에서 signout
    }
    
    func resetPassword() {
        print("ResetPassword")
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            // json 데이터를 User 클래스에 매핑
            guard let user = try? snapshot?.data(as: User.self) else { return }
            print("DEBUG: User is \(user)")
        }
    }
}
