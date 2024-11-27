//
//  AuthenticationViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/25/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
//import FirebaseCore
//struct SignInError: Identifiable {
//    let id = UUID()
//    let message: String
//}

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var signInError: String?
    @Published var registeringError: String?

    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email, mobileNumber: "", adress: "")
            let encodedUser = try Firestore.Encoder().encode(user)
            
            // MARK: this one - uploads info to firebase !
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            // MARK: ეს იმისთვის რომ როცა დალოგინებულ იუზერზე შევა, იუზერის შექმნის მომენტშივე, იმავდროულად მოახდინოს ამ იუზერის ინფორმაციის წამოღება.
            await fetchUser()
            
        } catch {
            registeringError = error.localizedDescription
            print("failed to create user with error - \(error.localizedDescription)")
        }
        
        print("create user")
    }
    
    func singnIn(with email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            // MARK: - u have to sign in first and then fetch the useruid to display uder data
            await fetchUser()
        } catch {
            signInError = error.localizedDescription
            print("failed to login with error - \(error.localizedDescription)")
        }
    }
 
    func singnOut() {
        do {
            try Auth.auth().signOut() // signs out userr on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("failed to sign out \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func addAddress(newAddress: String) async {
        guard let userID = userSession?.uid else {
            print("User ID not available")
            return
        }
        
        let db = Firestore.firestore()
        let ref = db.collection("users").document(userID)
        
        do {
             try await ref.updateData(["adress": newAddress])
             await fetchUser() // Optional: Refresh local user data after updating Firestore
         } catch {
             print("Failed to update address: \(error.localizedDescription)")
         }
    }
    
    func addMobileNumber(mobileNumber: String) async {
        guard let userID = userSession?.uid else {
            print("User ID not available")
            return
        }
        
        let db = Firestore.firestore()
        let ref = db.collection("users").document(userID)
        
        do {
             try await ref.updateData(["mobileNumber": mobileNumber])
             await fetchUser() // Optional: Refresh local user data after updating Firestore
         } catch {
             print("Failed to update mobile Number: \(error.localizedDescription)")
         }
    }
}



