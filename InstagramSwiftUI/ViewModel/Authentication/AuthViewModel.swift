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
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register() {
        print("Register")
    }
    
    func singout() {
        print("Signout")
    }
    
    func resetPassword() {
        print("ResetPassword")
    }
    
    func fetchUser() {
        print("FetchUser")
    }
   
   
}

