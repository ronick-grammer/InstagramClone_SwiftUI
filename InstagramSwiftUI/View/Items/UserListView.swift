//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/26.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing : 15) {
                ForEach(users) { user in
                    NavigationLink (
                        // 클릭했을 때 비로소 ProfileView를 빌드하고 이동한다.
                        // 즉, 모든 ProfileView를 모두 빌드해 놓지 않음으로써 효율성을 높인다.
                        destination: LazyView(ProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}
