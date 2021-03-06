//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                if let user = viewModel.post.user {
                    NavigationLink(
                        destination: LazyView(ProfileView(user: user)),
                        label: {
                            KFImage(URL(string: viewModel.post.ownerImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipped()
                                .cornerRadius(18)
                            
                            Text(viewModel.post.onwerUsername)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)

                    })
                }
            }.padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .frame(maxHeight: 300)
                .clipped()
                
            
            //action buttons
            HStack(spacing: 16) {
                Button(action: { // 좋아요를 이미 눌렀다면 취소시킴
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width:20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                NavigationLink(
                    destination: CommentView(post: viewModel.post),
                    label: {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width:20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            // caption
            HStack {
                
                Text(verbatim: viewModel.post.onwerUsername).font(.system(size: 14, weight: .semibold)) +
                    Text(" " + viewModel.post.caption)
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("\(TimestampString.dateString(viewModel.post.timestamp))")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
        
    }
}

/*
struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
*/
