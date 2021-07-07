//
//  CheckListViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class CheckListViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var addingDateLabel: UILabel!
    
    func setData(_ checklistCell: ChecklistCellModel) {
        titleLabel.text = checklistCell.film.title
        directorLabel.text = checklistCell.film.director
        genreLabel.text = checklistCell.film.genre.rawValue
        addingDateLabel.text = DateFormatter().string(from:checklistCell.addingDate)
    }
    
}
