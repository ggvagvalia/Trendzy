//
//  ProfilePageViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/26/24.
//

import FirebaseCore
import Firebase
import FirebaseFirestore
//
//class ProfilePageViewModel: ObservableObject {
//    func addAddress(newAddress: String) {
//        let db = Firestore.firestore()
//        let ref = db.collection("Adress").document(newAddress)
//        ref.setData(["address": newAddress]) { error in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}

//final class ProfilePageViewModel: ObservableObject {
//    @Published var personName: String = ""
//    @Published var email: String = ""
//    @Published var id: String = ""
//    @Published var address: String = ""
//    @Published var mobilenumber: String = ""
//    @Published var imageURL: String? = nil
//    private let authViewModel: AuthenticationViewModel
//    @Published var isEditing: Bool = false // Controls editing mode
//
//
//  
//    init(authViewModel: AuthenticationViewModel) {
//        self.authViewModel = authViewModel
//
//        Task { @MainActor in
//            loadUserData()
//        }
//    }
//
//    @MainActor func loadUserData() {
//        guard let currentUser = authViewModel.currentUser else { return }
//        self.personName = currentUser.fullName
//        self.email = currentUser.email
//        self.id = currentUser.id ?? ""
//        self.address = currentUser.adress ?? ""
//        self.mobilenumber = currentUser.mobileNumber ?? ""
//        self.imageURL = currentUser.imageURL
//    }
//    
// 
//    func saveChanges() async {
//        let updates: [String: Any] = [
//            "fullName": personName,
//            "adress": address,
//            "mobileNumber": mobilenumber,
//            "imageURL": imageURL ?? ""
//        ]
//
//        await authViewModel.updateProfile(with: updates)
//        isEditing = false
//    }
//}
