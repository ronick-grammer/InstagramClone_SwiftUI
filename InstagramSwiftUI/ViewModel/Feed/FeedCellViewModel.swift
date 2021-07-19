//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/19.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        print("Like post")
    }
    
    func unlike() {
        print("Unlike post")
    }
    
    func checkIfUserLikedPost() {
        
    }
}
