//
//  ProfilePage.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var showMobilePopUp = false
    @State private var showAdressPopUp = false
    @State private var fullName = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var address = ""
    
    var body: some View {
        if let user = viewModel.currentUser {
            VStack {
                Text(user.initials)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                
                Form {
                    Section(header: Text("Full Name")) {
                        TextField("Full Name", text: $fullName)
                            .disabled(true)
                            .onAppear { self.fullName = user.fullName }
                    }
                    
                    Section(header: Text("Email")) {
                        TextField("Email", text: $email)
                            .disabled(true)
                            .onAppear { self.email = user.email }
                    }
                    
                    Section(header: Text("Mobile Number")) {
                        HStack {
                            TextField("Mobile Number", text: $mobileNumber)
                                .disabled(true)
                                .onAppear { self.mobileNumber = user.mobileNumber ?? "" }
                            
                            Button(action: {
                                showMobilePopUp.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $showMobilePopUp) {
                                EditMobilenumberView { newMobilenumber in
                                    Task {
                                        await viewModel.addMobileNumber(mobileNumber: newMobilenumber)
                                        self.mobileNumber = newMobilenumber
                                    }
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Adress")) {
                        
                        HStack {
                            TextField("Address", text: $address)
                                .disabled(true)
                                .onAppear { self.address = user.adress ?? "" }
                            
                            Button(action: {
                                showAdressPopUp.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $showAdressPopUp) {
                                NewAdressView { newAddress in
                                    Task {
                                        await viewModel.addAddress(newAddress: newAddress)
                                        self.address = newAddress
                                    }
                                }
                            }
                        }
                    }
                    
                
                Section {
                    Button(action: {
                        viewModel.singnOut()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                            Text("Sign Out")
                                .foregroundColor(.red)
                        }
                    }
                    
                }
            }
        }
    } else {
        Text("No user data available.")
    }
}
}

struct NewAdressView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var addAdress = ""
    var onSave: (String) -> Void
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Address")) {
                    TextField("Enter Address", text: $addAdress)
                }
            }
            .navigationBarTitle("Add / Edit Address", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    if !addAdress.isEmpty {
                        onSave(addAdress)
                        dismiss()
                    }
                }
            )
        }
    }
}

struct EditMobilenumberView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var addMobileNumber = ""
    var onSave: (String) -> Void
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Mobile Number")) {
                    TextField("Enter Mobile Number", text: $addMobileNumber)
                }
            }
            .navigationBarTitle("Add / Edit Mobile Number", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    if !addMobileNumber.isEmpty {
                        onSave(addMobileNumber)
                        dismiss()
                    }
                }
            )
        }
    }
}

#Preview {
    ProfilePage()
        .environmentObject(AuthenticationViewModel())
}
