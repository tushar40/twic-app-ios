//
//  TwitterLoginButton.swift
//  Twic_App
//
//  Created by Tushar Gusain on 08/11/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

import SwiftUI
import TwitterKit
import FirebaseAuth

struct TwitterLoginButton: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<TwitterLoginButton>) -> TWTRLogInButton {
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
//            if (session != nil) {
//                print("signed in as \(String(describing: session?.userName))");
//            } else {
//                print("error: \(String(describing: error?.localizedDescription))");
//            }
            
            
            let login = FHSTwitterEngine.shared().loginController { (success) in
                       print("Success")
            }
            
            return login
            
//            if let error = error {
//                print("Failed to login via twitter: \(error)")
//                return
//            }
//
//            guard let token = session?.authToken else { return }
//            guard let secret  = session?.authTokenSecret else { return }
//
//            let credentials  = TwitterAuthProvider.credential(withToken: token, secret: secret)
//
//            Auth.auth().signIn(with: credentials) { user, error in
//                if let error = error {
//                    print("Failed to login to Firebase with Twitter \(error)")
//                    return
//                }
//
//                print("Successfully logged In with id: \(user?.credential)")
//            }
        })
        
        return logInButton
    }
    
    func updateUIView(_ uiView: TWTRLogInButton, context: UIViewRepresentableContext<TwitterLoginButton>) {
        
    }
}
//
//struct TwitterLoginButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TwitterLoginButton()
//    }
//}
