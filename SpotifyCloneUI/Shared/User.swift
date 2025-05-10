//
//  UserArray.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//


struct UserArray: Codable  {
    var users: [User]?
    var total, skip, limit: Int?
}

// MARK: - User
struct User: Codable, Identifiable {
    var id: Int?
    var firstName, lastName, maidenName: String?
    var age: Int?
    var email, phone, username, password: String?
    var birthDate: String?
    var image: String?
    var bloodGroup: String?
    var height, weight: Double?
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Vishal",
            lastName: "Rana",
            maidenName: "",
            age: 35,
            email: "vishal@test.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: Constants.randomImage,
            bloodGroup: "",
            height: 100.0,
            weight: 25.0
        )
    }
}
