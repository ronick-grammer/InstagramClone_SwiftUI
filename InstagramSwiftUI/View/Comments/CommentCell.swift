//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/21.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("spiderman")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("spiderman").font(.system(size: 14, weight: .semibold)) +
                Text("some test comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    } 
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
