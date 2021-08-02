//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/08/02.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    
    init(user: User) {
        self.viewModel = EditProfileViewModel(user: user)
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
                }, label: {
                    Text("Done").bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width:370, height: 200)
                .padding()
            
            Spacer()
        }
    }
}
