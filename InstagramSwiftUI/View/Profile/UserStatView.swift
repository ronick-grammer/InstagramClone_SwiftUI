//
//  UserStatView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/28.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
            
        }.frame(width: 80, alignment: .center) // 텍스트의 width 크기는 텍스트의 길이에 의해 자동 설정되기에 고정적인 width를 주어서 고정적인 정렬을 해준다.
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Posts")
    }
}
