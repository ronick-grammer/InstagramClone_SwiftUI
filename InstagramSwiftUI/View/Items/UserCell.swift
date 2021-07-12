//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/26.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    
    var body: some View {
        HStack {
            
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width : 40, height: 40)
                .clipShape(Circle())
                //.cornerRadius(18)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 13, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}

/*
struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
 */
