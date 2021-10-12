//
//  CustomSecureField.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/30.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text) //Swift UI에서 TextFiled의 placeholder는 색이 변경할수가 없다.
                    .padding(.leading, 11)
                    .foregroundColor(.white)
            }
        }
    }
}
