//
//  Film.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 07.07.2021.
//

import UIKit

struct Film {
    
    let title: String
    let director: String
    let annotation: String
    let image: UIImage
    let rating: Double
    let genre: Genre
}


enum Genre: String {
    
    case drama = "Драма"
    case horror = "Хоррор"
    case comedy = "Комедия"
    case thriller = "Триллер"
    case action = "Экшн"
}
