//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0 // 처음에는 feed 뷰
    
    var body: some View {
        Group { // 로그인 뷰와 MainTabView는 완전히 다른 독립된 뷰이기 때문에 ZStack을 사용하는 것은 좋지 않다.
            // 로그인되지 않은거면 로그인 화면
            if viewModel.userSession == nil {
                LoginView()
            } else { // 로그인 한거면 메인 화면
                if let user = viewModel.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
