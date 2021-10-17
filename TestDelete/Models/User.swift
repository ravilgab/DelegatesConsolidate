//
//  User.swift
//  TestDelete
//
//  Created by Ravil on 17.10.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "Mouse", password: "123", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    // let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Мыш", surname: "Пыш")
    }
}
