//
//  TextArea.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/07/16.
//

import SwiftUI

// SwiftUI의 TextField는 박스 오른쪽 구역을 넘어가면 줄바꿈을 해주지 않는다. 그래서 직접 만들어야 한다
struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
               
            }

            TextEditor(text: $text)
                .padding(4)
            
        }
    }
}
