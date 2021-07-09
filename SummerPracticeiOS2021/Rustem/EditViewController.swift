
import UIKit
import PhotosUI

class EditViewController: UIViewController, PHPickerViewControllerDelegate {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageImageView: UIImageView!
    weak var newImage: UIImage? = data.presentUser.image
    
    
    
    func favoGenreId() -> Int {
        let favGenre = data.presentUser.favoriteGenre
        let genres:[String] = [Genre.action.rawValue, Genre.comedy.rawValue, Genre.drama.rawValue, Genre.horror.rawValue, Genre.thriller.rawValue]
        guard let genreRow = genres.firstIndex(of: favGenre.rawValue) else { return 0}
        return genreRow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        nicknameTextField.text = data.presentUser.name
        imageImageView.image = data.presentUser.image
        genrePickerView.selectRow(favoGenreId(), inComponent: 0, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageImageView.image = newImage
        
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
                        self.imageImageView.image = theImage
                        self.newImage = self.imageImageView.image
                    }
                }
            }
            )
            
        }
        viewWillAppear(true)
        imageImageView.image = newImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        data.presentUser.checklist = []
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let newName = nicknameTextField.text
        data.presentUser.name = newName ?? data.presentUser.name
        data.presentUser.image = newImage ?? data.presentUser.image
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
            data.presentUser.favoriteGenre = Genre.action
        case 1:
            data.presentUser.favoriteGenre = Genre.comedy
        case 2:
            data.presentUser.favoriteGenre = Genre.drama
        case 3:
            data.presentUser.favoriteGenre = Genre.horror
        case 4:
            data.presentUser.favoriteGenre = Genre.thriller
        default:
            data.presentUser.favoriteGenre = Genre.action
        }
    }
}
