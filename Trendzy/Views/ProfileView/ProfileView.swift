//
//  ProfileView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        List {
            
            if let user = viewModel.currentUser {
                Text(user.initials)
                Text(user.fullName)
                Text(user.email)
                
                Button {
                    viewModel.singnOut()
                } label: {
                    HStack {
                        Image(systemName: "arrow.left.circle.fill")
                        Text("Sign out")
                            .tint(.red)
                    }
                }
                
            } else {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button {
                    viewModel.singnOut()
                } label: {
                    HStack {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.system(size: 20))
                        
                        Text("Sign out")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthenticationViewModel())
}
