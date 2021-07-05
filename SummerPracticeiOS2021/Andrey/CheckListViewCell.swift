//
//  CheckListViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class CheckListViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var addingDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(_ checklistCell: ChecklistCell) {
        title.text = checklistCell.film.title
        director.text = checklistCell.film.director
        genre.text = checklistCell.film.title
        addingDate.text = DateFormatter().string(from:checklistCell.addingDate)
    }
    
}
