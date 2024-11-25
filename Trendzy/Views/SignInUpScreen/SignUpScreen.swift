//
//  SignUpScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct SignUpScreen: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showSignIn: Bool
    
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 45) {
            TopView(title: "Welcome Back", details: "Please sign up in to your account")
            EmailView(title: "Email", text: $email)
            PasswordCheckField()
//            VStack(spacing: 25) {
//                PasswordView(title: "Password", text: $password)
//                HStack {
//                    Toggle(isOn: $remember, label: {
//                        Text("Label")
//                    })
//                    .toggleStyle(RememberEnteredInfo())
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Forget Password").bold()
//                            .font(.footnote)
//                    })
//                    .tint(.primary)
//                }
//                
//            }
            //                                .padding()
            
            SignInButton(title: "Sign Up") {
                
            }
            
            OrView(title: "or")
            
            HStack(spacing: 60) {
                AccountsView(image: .apple, width: 30, height: 30) {}
                AccountsView(image: .email, width: 30, height: 30) {}
                AccountsView(image: .google, width: 30, height: 30) {}
            }
            
            Spacer()
            
            Button(action: {
                email = ""
                password = ""
                withAnimation {
                    showSignIn.toggle()
                }
            }, label: {
                Text("Already have an account? ***Sign in***")
            })
            .tint(.primary)
        }
        .padding()
    }
}
//
//#Preview {
//    SignUpScreen()
//}
