//
//  PasswordCheckField.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/24/24.
//

import SwiftUI

struct PasswordCheckField: View {
    @State var text = ""
    @FocusState var isActive
    @State var showPassword: Bool = false
    @State private var checkMinCharacterCount: Bool = false
    @State private var checkPunctuation: Bool = false
    @State private var checkNumber: Bool = false
    
    var progressColor: Color {
        let containsNumbers = text.rangeOfCharacter(from: .decimalDigits) != nil
        let containsPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!?@#%^&")) != nil
        
        if containsNumbers && containsPunctuation && text.count > 5 {
            return .green
        } else if !containsNumbers && containsPunctuation {
            return .red
        } else if containsNumbers && !containsPunctuation {
            return .yellow
        } else if containsNumbers && containsPunctuation {
            return .blue
        } else {
            return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .leading) {
                ZStack {
                    SecureField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 0 : 1)
                    TextField("", text: $text)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55).focused($isActive)
                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
                        .opacity(showPassword ? 1 : 0)
                }
                Text("Password").padding(.horizontal)
                    .offset(y: (isActive || !text.isEmpty ? -50 : 0))
                    .foregroundStyle(isActive ? .gray : .secondary)
                    .animation(.spring, value: isActive)
                    .onTapGesture {
                        isActive = true
                    }
                    .onChange(of: text, { oldValue, newValue in
                        withAnimation {
                            checkMinCharacterCount = newValue.count >= 8
                            checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                            checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!?@#%^&")) != nil
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
                CheckText(text: "Minimum 8 characters", check: $checkMinCharacterCount)
                CheckText(text: "(!?@#%^&)", check: $checkPunctuation)
                CheckText(text: "Number", check: $checkNumber)
            }
        }
    }
}

struct CheckText: View {
    let text: String
    @Binding var check: Bool
    
    var body: some View {
        HStack {
            Image(systemName: check ? "checkmark.circle.fill" : "circle")
                .contentTransition(.symbolEffect)
            Text(text)
        }
        .foregroundStyle(check ? .primary : .secondary)
    }
}

//    #Preview {
//        PasswordView(title: "Enter Your Password", text: .constant(""))
//    }

