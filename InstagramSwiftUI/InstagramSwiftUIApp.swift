//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            // AuthViewModel을 초기화해야 해야 사용가능
            // AuthViewModel 은 한번만 초기화가 되는데
            // 매번 AuthViewModel의 Published 프로퍼티에 변화가 있을때마다 ContentView에 반영한다.
            ContentView().environmentObject(AuthViewModel())
            //LoginView()//.environmentObject(AuthViewModel())
        }
    }
}
