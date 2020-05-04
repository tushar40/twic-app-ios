//
//  ContentView.swift
//  Twic_App
//
//  Created by Tushar Gusain on 07/11/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    @State var socialPlatform = SocialPlatform.Facebook
    @State var presentSocialVC = false
    
    @State var presentImagePicker = false
    
    @State var image = UIImage(imageLiteralResourceName: "twitter_bgm")
    
    var imagePickerButton : some View {
        Button(action: {
            self.presentImagePicker.toggle()
        }) {
            Image(systemName: "camera")
                .imageScale(.large)
                .padding()
        }
        .sheet(isPresented: $presentImagePicker) {
            ImagePickerView(imageSelected: self.$image, isPickerShown: self.$presentImagePicker)
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
//                Button(action: {
//                    self.socialPlatform = .Facebook
//                    self.presentSocialVC.toggle()
//                }) {
//                    Image("facebook")
//                        .renderingMode(.original)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 100, height: 100)
//                        .padding()
//                }
                
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(Edge.Set.all)
                    VStack {
                        Button(action: {
                            self.socialPlatform = .Twitter
                            self.presentSocialVC.toggle()
                        }) {
                            Image("twitter")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        
                        TwitterLoginButton()
                            .frame(width: 80, height: 50)
                            .padding()
                    }
                }
                
            }
            .navigationBarItems(trailing: imagePickerButton)
            .sheet(isPresented: $presentSocialVC){
                SocialFeedSharingView(socialPlatform: self.$socialPlatform, imageToShare: self.$image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(socialPlatform: .Facebook)
    }
}
