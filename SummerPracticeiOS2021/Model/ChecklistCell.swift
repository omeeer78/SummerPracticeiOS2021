
struct ChecklistCellModel {
    
    let film: Film
    let addingDate: Date
    let status: Status
}


enum Status: Int {
    
    case wantToWatch = 0
    case watching = 1
    case completed = 2
}
