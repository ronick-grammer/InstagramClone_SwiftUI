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
                    PostGridView()
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
