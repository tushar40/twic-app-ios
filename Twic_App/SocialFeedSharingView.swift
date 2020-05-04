//
//  SocialFeedSharingView.swift
//  Twic_App
//
//  Created by Tushar Gusain on 07/11/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

import SwiftUI
import UIKit
import TwitterKit

struct SocialFeedSharingView: UIViewControllerRepresentable {
    
    @Binding var socialPlatform: SocialPlatform
    
    @Binding var imageToShare: UIImage
    
    
    func makeCoordinator() -> SocialFeedSharingView.Coordinator {
        Coordinator(self)
    }
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<SocialFeedSharingView>) ->  TWTRComposerViewController {
        
         FHSTwitterEngine.shared().permanentlySetConsumerKey("BT8kyCxE4M231MZYCuwRtKT0u", andSecret: "0G4KvmpQkUEHHsaDJtZiud2uAKru1CioAJpLdbLIcnboLRXNZY")
        
        var socialVC = TWTRComposerViewController.init(initialText: "TextExample", image: imageToShare, videoURL: nil)

        switch(socialPlatform) {
        case .Facebook:
            break
        //            socialVC = getSocialViewController(for: SLServiceTypeFacebook)
        case .Twitter:
            if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
                // App must have at least one logged-in user to compose a Tweet
               socialVC = TWTRComposerViewController.init(initialText: "TextExample", image: imageToShare, videoURL: nil)
            } else {
                if TWTRTwitter.sharedInstance().sessionStore.session() != nil {
                            print("user signed in with twitter ..")
                } else {
                    print("No session available , getting logged in user details")
                }
                // Log in, and then check again
                TWTRTwitter.sharedInstance().logIn { session, error in
                    if session != nil { // Log in succeeded
                        print("login succeeded")
                        socialVC = TWTRComposerViewController.init(initialText: "Now something will be tweeted", image: self.imageToShare, videoURL: nil)
                    } else {
                        socialVC = TWTRComposerViewController.emptyComposer()
                        print("No twitter accounts available")
                    }
                }
                
                
            }
        }
        
        socialVC.delegate = context.coordinator
        
        return socialVC
    }
    
//    private func getSocialViewController(for serviceType: String) -> SLComposeViewController {
//        if SLComposeViewController.isAvailable(forServiceType: serviceType) {
//            return SLComposeViewController(forServiceType: serviceType)
//        } else {
//            print("You are not logged in to your \(socialPlatform) account")
//            return SLComposeViewController()
//        }
//    }
    
    func updateUIViewController(_ uiViewController: TWTRComposerViewController, context: UIViewControllerRepresentableContext<SocialFeedSharingView>) {
        
    }
    
    class Coordinator: NSObject, TWTRComposerViewControllerDelegate {
        var parent: SocialFeedSharingView
        
        init(_ parent: SocialFeedSharingView) {
            self.parent = parent
        }
        
        func composerDidCancel(_ controller: TWTRComposerViewController) {
            print("User cancelled tweet")
        }
        
        func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
            print("Successfully tweeted")
        }
        
        func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
            print("Unable to publish tweet ,Error= \(error.localizedDescription)")
        }
    }
}

//struct SocialFeedSharingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SocialFeedSharingView()
//    }
//}
