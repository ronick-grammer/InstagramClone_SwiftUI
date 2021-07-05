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
//            ContentView()
            LoginView().environmentObject(AuthViewModel()) // AuthViewModel을 초기화해야 해야 사용가능
        }
    }
}
