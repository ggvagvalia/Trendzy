//
//  EmailView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/25/24.
//

import SwiftUI

struct EmailView: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty ? -40 : 0))
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .primary : .secondary)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}
//
//#Preview {
//    EmailView()
//}
