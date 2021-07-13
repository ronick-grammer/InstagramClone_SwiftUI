//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group { // 로그인 뷰와 MainTabView는 완전히 다른 독립된 뷰이기 때문에 ZStack을 사용하는 것은 좋지 않다.
            // if not logged in show login
            if viewModel.userSession == nil {
                LoginView()
            } else {// else show main interface
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}