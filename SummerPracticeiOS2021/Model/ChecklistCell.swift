import UIKit

struct ChecklistCellModel {
    
    var film: Film
    var addingDate: Date
    var status: Status
}


enum Status: Int {
    
    case wantToWatch = 0
    case watching = 1
    case completed = 2
}
