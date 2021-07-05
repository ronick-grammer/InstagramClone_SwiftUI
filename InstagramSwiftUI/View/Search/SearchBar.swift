//
//  SearchBar.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text : String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture{ // 텍스트 박스 안을 클릭하면
                    isEditing = true;
                }
                
            if isEditing { // 작성중이면 취소 버튼 활성화
                Button(action: {
                    // 취소 버튼을 누르면 다시 작성중이던 text는 초기화 시킨다.
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing() // 취소하면 키보드가 내려가도록 함
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search!!!"), isEditing: .constant(true))
    }
}
