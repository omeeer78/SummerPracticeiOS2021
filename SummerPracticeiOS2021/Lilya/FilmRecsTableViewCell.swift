//
//  FilmRecsTableViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 09.07.2021.
//

import UIKit

class FilmRecsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmRecsImage: UIImageView!
    @IBOutlet weak var filmRecsLabel: UILabel!

    func setData(recsFilm: Film)  {
        filmRecsImage.image = recsFilm.image
        filmRecsLabel.text = recsFilm.title
    }
}
