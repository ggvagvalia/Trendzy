//
//  SignInUpScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct SignInUpScreen: View {
    @State var email = ""
    @State var password = ""
    @State var remember = false
    @State var showSignUp = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if showSignUp {
                SignUpScreen(email: $email, password: $password, remember: $remember, showSignIn: $showSignUp, action: {})
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            } else {
                SignInScreen(email: $email, password: $password, remember: $remember, showSignUp: $showSignUp, action: {})
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

#Preview {
    SignInUpScreen()
}
