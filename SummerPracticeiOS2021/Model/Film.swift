//
//  Film.swift
//  SummerPracticeiOS2021
//
//  Created by Alina Bikkinina on 05.07.2021.
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
    
    case drama = "DRAMA"
    case horror = "HORROR"
    case comedy = "COMEDY"
    case thriller = "THRILLER"
    case action = "ACTION"
}
