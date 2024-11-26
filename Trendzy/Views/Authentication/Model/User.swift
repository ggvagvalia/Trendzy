//
//  User.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/25/24.
//

import SwiftUI
import FirebaseFirestore

struct User: Identifiable, Codable {
    let id: String
//    @DocumentID var id: String?
    let fullName: String
    let email: String
    let mobileNumber: String?
    let adress: String?
//    let mobileNumber: String?
//    var imageURL: String?

    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()

        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}


//extension User {
//    static var Mock_User = User(id: NSUUID().uuidString, fullName: "Gvantsa Gvagvalia", email: "GvantsaGvagvalia@gmail.cocm")
//}
