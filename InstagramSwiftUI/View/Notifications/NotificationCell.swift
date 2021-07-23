//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/27.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification
    
    private var showPostImage: Bool {
        return notification.type != .follow ? true : false
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(notification.username).font(.system(size: 14, weight: .semibold)) +
                Text(notification.type.notificationMessage)
                .font(.system(size: 15))
                
            Spacer()
            
            if showPostImage { // 누군가가 댓글이나 좋아요를 남겼다면 특정 메시지 알림
                Image("spiderman")
                    .resizable()
                    .scaledToFill()
                    .frame(width:40, height: 40)
            } else { // 누군가가 팔로우 했다면 팔로우 버튼 생성
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
            
        }.padding(.horizontal)
    }
}

/*
struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
*/
