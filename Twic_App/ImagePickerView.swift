//
//  ImagePickerView.swift
//  Twic_App
//
//  Created by Tushar Gusain on 07/11/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var imageSelected: UIImage
    
    @Binding var isPickerShown: Bool
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = context.coordinator
        imagePickerVC.sourceType = .photoLibrary
        return imagePickerVC
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
    class Coordinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
            
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                print(selectedImage)
                self.parent.imageSelected = selectedImage
            }
            self.parent.isPickerShown = false
        }
    }
    
}

//struct ImagePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView()
//    }
//}
