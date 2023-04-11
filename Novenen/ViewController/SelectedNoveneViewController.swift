import UIKit

class SelectedNoveneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIScrollViewDelegate, UITextViewDelegate {
    
    var passedNovene: [Novene] = []
    var selectedRow : Int?

    @IBOutlet weak var textViewNovene: UITextView!
    @IBOutlet weak var pickerViewTage: UIPickerView!
    @IBOutlet weak var labelTagesueberschrift: UILabel!
    @IBOutlet weak var buttonGoToLitanei: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerViewTage.dataSource = self
        self.pickerViewTage.delegate = self
        self.textViewNovene.delegate = self
        
        //Hintergrund-Transparenz der top Navigation Bar entfernen
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = passedNovene[0].Novenenname
        
        labelTagesueberschrift.numberOfLines = 0
        labelTagesueberschrift.sizeToFit()
        //[labelTagesueberschrift .sizeToFit]
        labelTagesueberschrift.text = passedNovene[0].Tagesueberschrift
        
        textViewNovene.text = passedNovene[0].Tagestext
        //textViewNovene.layer.cornerRadius = 20.0
        //textViewNovene.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        buttonGoToLitanei.isHidden = true
        buttonGoToLitanei.layer.cornerRadius = 10.0
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return passedNovene.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedRow = row
        return passedNovene[row].Tag
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Autoadjust height of label
        labelTagesueberschrift.text = passedNovene[row].Tagesueberschrift
        labelTagesueberschrift.numberOfLines = 0
        [labelTagesueberschrift .sizeToFit]
        textViewNovene.text = passedNovene[row].Tagestext
        
        buttonGoToLitanei.isHidden = true
     }
        
  
    //check if textview scrolled to end/bottom
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= scrollView.contentSize.height - (scrollView.frame.size.height + 10) && selectedRow != 0) {
            buttonGoToLitanei.isHidden = false
        } else {
            buttonGoToLitanei.isHidden = true
        }
    }

}
