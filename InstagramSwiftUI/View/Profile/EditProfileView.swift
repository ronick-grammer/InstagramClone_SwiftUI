//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/08/02.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""  
    var body: some View {
        
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
