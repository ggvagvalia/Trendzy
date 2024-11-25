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

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
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
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            
            // MARK: this one - uploads info to firebase !
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            // MARK: ეს იმისთვის რომ როცა დალოგინებულ იუზერზე შევა, იუზერის შექმნის მომენტშივე, იმავდროულად მოახდინოს ამ იუზერის ინფორმაციის წამოღება.
            await fetchUser()
        } catch {
            print("failed to create user with error - \(error.localizedDescription)")
        }
        
        print("create user")
    }
    
    func singnIn(with email: String, password: String) async throws {
        print("sign in")
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
//        print("debug! current user is \(self.currentUser)")
    }
}



