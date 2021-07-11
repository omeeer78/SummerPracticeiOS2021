//
//  User.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//
import UIKit

class User {
    
    var name: String
    var image: UIImage
    var favoriteGenre: Genre
    var password: String
    var friends: [User]
    var checklist: [ChecklistCellModel]
    
    init(name:String, image:UIImage, favoriteGenre:Genre, password:String, friends:[User], checklist :[ChecklistCellModel]){
        self.name = name
        self.image = image
        self.favoriteGenre = favoriteGenre
        self.password = password
        self.friends = friends
        self.checklist = checklist
    }
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
