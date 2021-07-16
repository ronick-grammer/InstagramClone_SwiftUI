//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/21.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage? // UIKit 에서 얻어지는 Image
    @State var postImage: Image? // Swift UI 이미지
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel =  UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                // 버튼을 클릭하면 imagePickerPresened의 값이 바뀐다.
                Button(action: {imagePickerPresented.toggle() }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/) // 이미지의 foregroundColor를 변경하려면 필요함
                        .scaledToFill()
                        .frame(width:130, height: 130)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                    // imagePickerPresented의 값이 바뀔때마다(true일때마다?) sheet이 보여진다.
                    // sheet이 내려갈때 onDismiss 클로저가 실행된다.
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top) {
                        image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    //TextField("Enter your caption..", text: $captionText)
                    // SwiftUI 에서는 특정 박스의 크기를 넘어가는 문자열을 다음칸으로 넘어가게 하지 않으므로
                    // 따로 만들어줘야 한다.
                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                }.padding()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            captionText = ""
                            postImage = nil
                            tabIndex = 0 // 업로드를 마치면 feed 뷰로
                            
                            print("DEBUG: Uploaded post")
                        }
                    }
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }).padding()
            }
            
            Spacer()
        }.padding(.top)
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage) // UIKit 이미지를 Swift UI Image로 변환
    }
}

/*
struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
            UploadPostView()
    }
}
*/
