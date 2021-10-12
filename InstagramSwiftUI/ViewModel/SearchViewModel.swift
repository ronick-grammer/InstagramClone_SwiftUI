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
        // Document에 있는 모든 유저 정보를 가져온다
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { snapshot in
                // user의 json 정보를 User 객체로 매핑
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                self.users.append(user)
            }
            /*
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            */
            //print(self.users)
        }
    }
    
    func filteredUsers(_ query: String) -> [User] { 
        let lowercasedQuery = query.lowercased() // 전부 소문자로 하여 대문자간 충돌이 없게 한다.
        
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) ||
            $0.username.lowercased().contains(lowercasedQuery)
        })
    }
    
}
