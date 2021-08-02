//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/08/02.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.saveUserDate(bioText)
                    print("uploadComplete: \(viewModel.uploadComplete)")
                }, label: {
                    Text("Done").bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width:370, height: 200)
                .padding()
            
            Spacer()
        }.onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed { // 업데이트가 끝나면 닫기
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}
