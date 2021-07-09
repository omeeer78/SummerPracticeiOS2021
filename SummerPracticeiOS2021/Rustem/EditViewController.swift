
import UIKit
import PhotosUI

class EditViewController: UIViewController, PHPickerViewControllerDelegate {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    var newImage: UIImage = data.presentUser.image
    var newFavoGengre: Genre = data.presentUser.favoriteGenre
    
    
    
    func favoGenreId() -> Int {
        let favGenre = data.presentUser.favoriteGenre
        let genres: [String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue]
        guard let genreRow = genres.firstIndex(of: favGenre.rawValue) else { return 0 }
        return genreRow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        nicknameTextField.text = data.presentUser.name
        userAvatarImageView.image = data.presentUser.image
        genrePickerView.selectRow(favoGenreId(), inComponent: 0, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userAvatarImageView.image = newImage
        
    }
    
    @IBAction func changeImageButton(_ sender: Any){
        var configure: PHPickerConfiguration = PHPickerConfiguration()
        configure.filter = .any(of: [.images])
        configure.selectionLimit = 1
        let picker: PHPickerViewController = PHPickerViewController(configuration: configure)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if (!results.isEmpty){
            results[0].itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {
                (obj, errors) in
                if let theImage = obj as? UIImage {
                    DispatchQueue.main.async {
                        self.userAvatarImageView.image = theImage
                        self.newImage = self.userAvatarImageView.image ?? UIImage()
                    }
                }
            }
            )
        }
        viewWillAppear(true)
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        data.presentUser.checklist = []
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let newName = nicknameTextField.text
        if (newName != ""){
            data.presentUser.name = newName ?? data.presentUser.name
        }
        data.presentUser.image = newImage
        data.presentUser.favoriteGenre = edit.newFavoGengre
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

var edit = EditViewController.init()

extension UIViewController: UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let genres: [String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue]
        return genres[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            edit.newFavoGengre = Genre.action
        case 1:
            edit.newFavoGengre = Genre.comedy
        case 2:
            edit.newFavoGengre = Genre.drama
        case 3:
            edit.newFavoGengre = Genre.horror
        case 4:
            edit.newFavoGengre = Genre.thriller
        default:
            edit.newFavoGengre = Genre.action
        }
    }
}
