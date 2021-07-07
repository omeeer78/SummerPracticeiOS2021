
import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    func favoGenreId() -> Int {
        let favGenre = data.users[0].favoriteGenre
        let genres:[String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue]
        guard let genreRow = genres.firstIndex(of: favGenre.rawValue) else { return 0}
        return genreRow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        nicknameTextField.text = data.users[0].name
        genrePickerView.selectRow(favoGenreId(), inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reset(_ sender: UIButton) {
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let newName = nicknameTextField.text
        data.users[0].name = newName ?? data.users[0].name
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
        let genres:[String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue]
        return genres[row]
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

