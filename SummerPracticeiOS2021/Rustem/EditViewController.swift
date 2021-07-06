
import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        nicknameField.text = data.users[0].name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reset(_ sender: UIButton) {
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let newName = nicknameField.text
        data.users[0].name = newName!
        navigationController?.popToRootViewController(animated: true)
    }
    
}
extension UIViewController: UIPickerViewDataSource{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

extension UIViewController: UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let favGenre = data.users[0].favoriteGenre
        let genres:[String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue] as? [String] ?? []
        genres.firstIndex(of: favGenre.rawValue)
        return genres[0]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            data.users[0].favoriteGenre = Genre.action
        case 1:
            data.users[0].favoriteGenre = Genre.comedy
        case 2:
            data.users[0].favoriteGenre = Genre.drama
        case 3:
            data.users[0].favoriteGenre = Genre.horror
        case 4:
            data.users[0].favoriteGenre = Genre.thriller
        default:
            data.users[0].favoriteGenre = Genre.action
        }
    }
}

