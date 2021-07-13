//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/26.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            
            Image("spiderman")
                .resizable()
                .scaledToFill()
                .frame(width : 40, height: 40)
                .clipShape(Circle())
                //.cornerRadius(18)
            
            VStack(alignment: .leading) {
                Text("spiderman")
                    .font(.system(size: 13, weight: .semibold))
                Text("Peter Parker")
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
