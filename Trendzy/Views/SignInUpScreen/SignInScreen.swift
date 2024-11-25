//
//  SignInScreen.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/21/24.
//

import SwiftUI

struct SignInScreen: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    //    @Binding var showSignIn: Bool
    @Binding var showSignUp: Bool
    
    var action: () -> Void
    
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
            //                                .padding()
            
            SignInButton(title: "Sign In") {
                
            }
            //                .padding(.vertical)
            
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
                    showSignUp.toggle()
                }
            }, label: {
                Text("Don't have an account? ***Sign up***")
            })
            .tint(.primary)
        }
        .padding()
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

struct SignInButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            
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

#Preview {
    SignInUpScreen()
}
