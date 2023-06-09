import UIKit
import AVFoundation

class SelectedNoveneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIScrollViewDelegate, UITextViewDelegate {
    
    var passedNovene: [Novene] = []
    var selectedRow : Int = 0

    @IBOutlet weak var textViewNovene: UITextView!
    @IBOutlet weak var pickerViewTage: UIPickerView!
    @IBOutlet weak var labelTagesueberschrift: UILabel!
    @IBOutlet weak var buttonGoToLitanei: UIButton!
    
    @IBOutlet weak var buttonReadAloudText: UIButton!
    
    @IBAction func readAloudText(_ sender: Any) {
        guard let text = textViewNovene.text else { return }
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: text)
            
            // Set the desired speech settings (optional)
            speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
            
            // Speak the text
            speechSynthesizer.speak(speechUtterance)
        
    }
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
        labelTagesueberschrift.text = passedNovene[0].Tagesueberschrift
        
        //Add new lines so appearing button doesn't overlap text
        textViewNovene.text = passedNovene[0].Tagestext! + "\n\n"
        
        buttonGoToLitanei.setTitle(passedNovene[selectedRow].Litaneiueberschrift, for: .normal)
        buttonGoToLitanei.layer.cornerRadius = 10.0
        buttonGoToLitanei.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Change text of Back Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: passedNovene[0].Novenenname, style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
            let fontSize = UserDefaults.standard.double(forKey: "Fontsize")
            let newFont = textViewNovene.font?.withSize(fontSize)
            textViewNovene.font = newFont
        
        //check if textview scrolled to end/bottom
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            if (scrollView.contentOffset.y >= scrollView.contentSize.height - (scrollView.frame.size.height + 50) && selectedRow != 0 && passedNovene[1].Litanei?.isEmpty == false) {
                buttonGoToLitanei.isHidden = false
            } else {
                buttonGoToLitanei.isHidden = true
            }
        }
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
        selectedRow = row
        //Autoadjust height of label
        labelTagesueberschrift.text = passedNovene[row].Tagesueberschrift
        labelTagesueberschrift.numberOfLines = 0
        labelTagesueberschrift.sizeToFit()
        
        textViewNovene.text = passedNovene[row].Tagestext! + "\n\n"
        textViewNovene.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
        buttonGoToLitanei.setTitle(passedNovene[row].Litaneiueberschrift, for: .normal)
        
        //Show Button when TextView doesn't require to scroll
        if (self.textViewNovene.contentSize.height-5 <= self.textViewNovene.frame.size.height && row != 0 && passedNovene[1].Litanei?.isEmpty == false) {
            buttonGoToLitanei.isHidden = false
        } else {
            buttonGoToLitanei.isHidden = true
        }
     }
        
  
    //check if textview scrolled to end/bottom
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y >= scrollView.contentSize.height - (scrollView.frame.size.height + 50) && selectedRow != 0 && passedNovene[1].Litanei?.isEmpty == false) {
            buttonGoToLitanei.isHidden = false
        } else {
            buttonGoToLitanei.isHidden = true
        }
    }
    
    //Navigate to LitaneiViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segueZurLitanei" {
                var litaneiVC = LitaneiViewController()
                litaneiVC = segue.destination as! LitaneiViewController
                litaneiVC.litanei = passedNovene[selectedRow].Litanei
                litaneiVC.litaneiUeberschrift = passedNovene[selectedRow].Litaneiueberschrift
        }
    }
      
}
