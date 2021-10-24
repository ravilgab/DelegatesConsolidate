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
    let age: String
    let about: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Мыш", surname: "Пыш", age: "3", about: "Мышка это кошка. Мама нашла ее когда она кушала салфетку в парке. Она любит есть, спать, есть, играть, есть, есть, шкодить и еще есть. ", image: "MouseTheCat")
    }
}
