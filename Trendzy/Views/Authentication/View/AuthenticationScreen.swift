//
//  AuthenticationScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct AuthenticationScreen: View {
    @State var email = ""
    @State var fullName = ""
    @State var password = ""
    @State var remember = false
//    @State var showSignUp = true
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        
            if viewModel.userSession != nil {
                HomeView()

            } else {
                LoginScreen(email: $email, fullName: $fullName, password: $password, remember: $remember)

        }
        
    }
}

#Preview {
    AuthenticationScreen()
        .environmentObject(AuthenticationViewModel())
}
