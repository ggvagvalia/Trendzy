//
//  RegistrationScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct RegistrationScreen: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var fullName: String
    @Binding var password: String
    @Binding var remember: Bool
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var isPasswordValid: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                TopView(title: "Welcome Back", details: "Please sign up in to your account")
                
                EmailView(title: "Email", text: $email)
                
                EmailView(title: "Full Name", text: $fullName)
                
                PasswordValidation(password: $password, isPasswordValid: $isPasswordValid)
                
                SignInUpButton(title: "Sign Up") {
                    Task {
                        print("Password: \(password)")
                        guard isPasswordValid else {
                            print("Password must be at least 6 characters long.")
                            return
                        }
                        try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                        if viewModel.registeringError != nil {
                            showAlert = true
                        }
                    }
                }
                .disabled(!formIssValid)
                .opacity(formIssValid ? 1.0 : 0.5)
                
                OrView(title: "or")
                
                HStack(spacing: 60) {
                    AccountsView(image: .apple, width: 30, height: 30) {}
                    AccountsView(image: .email, width: 30, height: 30) {}
                    AccountsView(image: .google, width: 30, height: 30) {}
                }
            }
        }
        .safeAreaPadding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Sign In Failed"),
                message: Text(viewModel.signInError ?? "Unknown error"),
                dismissButton: .default(Text("OK")) {
                    viewModel.registeringError = nil
                }
            )
        }
        NavigationLink {
            LoginScreen(email: $email, fullName: $fullName, password: $password, remember: $remember)
                .navigationBarBackButtonHidden(true)
        } label: {
            Text("Already have an account? ***Sign in***")
                .tint(.primary)
        }
    }
}

extension RegistrationScreen: AuthenticationFormProtocol {
    var formIssValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password.filter { $0.isLetter }.count >= 6
    }
}

//#Preview {
//    RegistrationScreen()
//}
