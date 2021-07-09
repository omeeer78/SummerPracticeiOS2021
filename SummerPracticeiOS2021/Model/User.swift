//
//  User.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//
import UIKit

struct User {
    
    var name: String
    var image: UIImage
    var favoriteGenre: Genre
    var password: String
    var friends: [User]
    var checklist: [ChecklistCellModel]

}

extension User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.password == rhs.password
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(password)
    }
}
