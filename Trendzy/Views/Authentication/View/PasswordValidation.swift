//
//  PasswordCheckField.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/24/24.
//

import SwiftUI

protocol AuthenticationFormProtocol {
    var formIssValid: Bool { get }
}
struct PasswordValidation: View {
    @Binding var password: String
    //    @State var text = ""
    @FocusState var isActive
    @State var showPassword: Bool = false
    @State private var checkMinCharacterCount: Bool = false
    @State private var checkPunctuation: Bool = false
    @State private var checkNumber: Bool = false
    @Binding var isPasswordValid: Bool
    
    var progressColor: Color {
        if isPasswordValid {
              return .green
          } else if password.count > 6 {
              return .yellow
          } else {
              return .red
          }
    }
    
    func validatePassword(_ password: String) {
        let alphabeticCount = password.filter { $0.isLetter }.count
        let containsMinLength = alphabeticCount >= 6
        let containsNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        let containsPunctuation = password.rangeOfCharacter(from: CharacterSet(charactersIn: "!?@#%^&")) != nil
        
        checkMinCharacterCount = containsMinLength
        checkNumber = containsNumber
        checkPunctuation = containsPunctuation
        
        isPasswordValid = containsMinLength && containsNumber && containsPunctuation
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .leading) {
                ZStack {
                    SecureField("Password", text: $password)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 0 : 1)
                    TextField("", text: $password)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55).focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 1 : 0)
                }
                Text("Password").padding(.horizontal)
                    .offset(y: (isActive || !password.isEmpty ? -40 : 0))
                    .foregroundStyle(isActive ? .gray : .secondary)
                    .animation(.spring, value: isActive)
                    .onTapGesture {
                        isActive = true
                    }
                    .onChange(of: password, { oldValue, newValue in
                        withAnimation {
//                            _ = progressColor
                            validatePassword(newValue) //
                        }
                    })
            }
            .overlay(alignment: .trailing) {
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding(16)
                    .contentShape(Rectangle())
                    .foregroundStyle(showPassword ? .primary : .secondary)
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
            VStack(alignment: .leading, spacing: 10) {
                CheckText(text: "Minimum 6 characters", check: $checkMinCharacterCount)
                CheckText(text: "(!?@#%^&)", check: $checkPunctuation)
                CheckText(text: "Number", check: $checkNumber)
            }
            ProgressView(value: min(Double(password.count), 8), total: 8)
                         .progressViewStyle(LinearProgressViewStyle(tint: progressColor))
            
        }
    }
}

struct CheckText: View {
    let text: String
    @Binding var check: Bool
    
    var body: some View {
        HStack {
            Image(systemName: check ? "checkmark.circle.fill" : "circle")
                .foregroundColor(check ? .green : .gray)
                .contentTransition(.symbolEffect)
            Text(text)
                .foregroundColor(check ? .green : .gray)
        }
        .foregroundStyle(check ? .primary : .secondary)
    }
}

//    #Preview {
//        PasswordView(title: "Enter Your Password", text: .constant(""))
//    }

