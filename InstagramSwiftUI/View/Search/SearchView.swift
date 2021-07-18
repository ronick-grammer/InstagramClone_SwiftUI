//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView(config: PostGridConfiguration.explore) // 모든 사진들 게시
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
