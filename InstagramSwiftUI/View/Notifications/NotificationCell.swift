//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/27.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    private var showPostImage: Bool {
        return viewModel.notification.type != .follow ? true : false
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.user {
                NavigationLink (
                    destination: ProfileView(user: user),
                    label: {
                        KFImage(URL(string: viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) +
                            Text(viewModel.notification.type.notificationMessage)
                            .font(.system(size: 15))
                })
            }
            
            Spacer()
            
            if showPostImage { // 누군가가 댓글이나 좋아요를 남겼다면 특정 메시지 알림
                if let post = viewModel.post {
                    NavigationLink(
                        destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                        label: {
                            KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width:40, height: 40)
                                .clipped()
                    })
                }
            } else { // 누군가가 팔로우 했다면 팔로우 버튼 생성
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
            
        }.padding(.horizontal)
    }
}
