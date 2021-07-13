//
//  CustomTextField.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/30.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imgName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text) //Swift UI에서 TextFiled의 placeholder는 색이 변경할수가 없다.
                    .padding(.leading, 11)
                    
                    
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomTextField(text: .constant(""), placeholder: Text("Email"), imgName: "envelope")
    }
}
