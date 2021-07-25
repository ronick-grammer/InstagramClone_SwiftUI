//
//  PostGridViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/17.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forCofig: config)
    }
    
    // 타입에 따른 포스트 목록 가져오기
    func fetchPosts(forCofig config: PostGridConfiguration) {
        switch config {
        case .explore : fetchExplorePagePosts()
        case .profile(let uid): fetchUserPosts(forUid: uid)
        }
    }
    
    // 모든 유저의 포스트를 가져온다
    func fetchExplorePagePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    // 해당 유저의 포스트들만 가져온다
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
