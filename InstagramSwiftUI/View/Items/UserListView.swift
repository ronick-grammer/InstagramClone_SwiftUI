//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/26.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing : 15) {
                ForEach(viewModel.users) { user in
                    NavigationLink (
                        // label을 클릭했을 때 destination view로 이동
                        destination: ProfileView(),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: SearchViewModel())
    }
}
