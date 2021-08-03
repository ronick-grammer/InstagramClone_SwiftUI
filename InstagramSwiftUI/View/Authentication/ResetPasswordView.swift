//
//  RestPasswordView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/29.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String

    init(email: Binding<String>) {
        self._email = email // ??
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // 전부 채움
            
            VStack {
                Image("instagram_title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                
                VStack(spacing: 20) {
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imgName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                }
         
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Send Reset Password Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        //.cornerRadius(25) // height 를 반으로 나눈 값이면 Capsule 효과
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }).padding(.bottom, 16)
                
            }
            .padding(.top, -44)
        } // publised 변수 값이 바뀔 때 호출
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss() // 리셋 요청하면 뒤로 가기
        }
    }
}

/*
struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
*/
