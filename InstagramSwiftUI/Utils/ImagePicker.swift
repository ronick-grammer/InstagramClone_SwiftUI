//
//  ImagePicker.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/28.
//

import SwiftUI

// View Controller에서 일어나는 액션을 처리해서 Swift UI로 넘긴다
// 공부해볼것
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode // 사진이 선택되면 sheet을 사라지게 하기 위해 사용
    
    // Swift UI 안에서 필요한 View Controller를 생성한다.
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
     
    // View Controller 에서 일어나는 액션을 처리해서 Swift UI로 넘겨준다.
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // UIImagePickerController를 실행하기 위해 필요한 프로토콜들
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        // 유저가 UIImagePicker로 부터 이미지를 선택할 때 처리리하는 함수
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 유저가 선택한 사진 저장, 유저가 사진을 선택하면 그 해당 사진을 저장하여 설명을 넣고 share 하는 화면에서 보여질 수 있도록 한다.
            guard let image = info[.originalImage] as? UIImage else { return }
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss() // 사진을 선택하면 이미지 창을 바로 닫는다.
        }
    }
}
