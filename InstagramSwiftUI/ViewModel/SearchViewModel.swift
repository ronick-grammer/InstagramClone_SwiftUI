//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/09.
//

import SwiftUI

class SearchViewModel: ObservableObject { 
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments {snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { snapshot in
                guard let user = try? snapshot.data(as: User.self) else { return }
                self.users.append(user)
            }
            /*
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            */
            print(self.users)
        }
    }
}
