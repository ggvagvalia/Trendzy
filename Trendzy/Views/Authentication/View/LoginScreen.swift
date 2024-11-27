//
//  LoginScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct LoginScreen: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var fullName: String
    @Binding var password: String
    @Binding var remember: Bool
    //    @Binding var showSignUp: Bool
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var showAlert: Bool = false

//    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 45) {
            TopView(title: "Welcome Back", details: "Please sign up in to your account")
            EmailView(title: "Email", text: $email)
            VStack(spacing: 25) {
                PasswordView(title: "Password", text: $password)
                HStack {
                    Toggle(isOn: $remember, label: {
                        Text("Label")
                    })
                    .toggleStyle(RememberEnteredInfo())
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Forget Password").bold()
                            .font(.footnote)
                    })
                    .tint(.primary)
                }
                
            }
            SignInUpButton(title: "Sign In") {
                Task {
                    try await viewModel.singnIn(with: email, password: password)
                    if viewModel.signInError != nil {
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
            
            Spacer()
            
            NavigationLink {
                RegistrationScreen(
                    email: $email,
                    fullName: $fullName,
                    password: $password,
                    remember: $remember)
                    .safeAreaPadding()
                    .navigationBarBackButtonHidden(true)
            } label: {                                
                Text("Don't have an account? ***Sign up***")
                            .tint(.primary)

            }

        }
        .padding()
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Sign In Failed"),
                        message: Text(viewModel.signInError ?? "Unknown error"),
                        dismissButton: .default(Text("OK")) {
                            viewModel.signInError = nil
                        }
                    )
                }
    }
}


struct TopView: View {
    var title: String
    var details: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.title.bold())
            Text(details)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RememberEnteredInfo: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect)
                Text("Remember")
            }
        }
        .tint(.primary)
    }
}

struct SignInUpButton: View {
    var title: String
    //    var action: () -> Void
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
            
        }, label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.primary, in: .rect(cornerRadius: 16))
        })
        .tint(.primary)
    }
}

struct OrView: View {
    var title: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
            
            Text(title)
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
}

struct AccountsView: View {
    var image: AccountsSystemImages
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: image.rawValue)
                .renderingMode(.template)
                .font(.system(size: 30))
                .foregroundStyle(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray.opacity(0.3))
                }
        })
    }
}

enum AccountsSystemImages: String {
    case apple = "apple.logo"
    case email = "envelope.fill"
    case google = "g.circle"
}

extension LoginScreen: AuthenticationFormProtocol {
    var formIssValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password.filter { $0.isLetter }.count >= 6
    }
}

#Preview {
    AuthenticationScreen()
        .environmentObject(AuthenticationViewModel())
}
