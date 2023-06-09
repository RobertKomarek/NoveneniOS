import UIKit
import AVFoundation 

class SelectedBibelstelleViewController: UIViewController {
    
    var randomBibelstelle : [BibelStelle] = []
    
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var KapitelText : String?
    var randomInt : Int = 0
   
    @IBOutlet weak var buttonReadAloud: UIButton!
    @IBOutlet weak var textViewKapiteltext: UITextView!
    @IBOutlet weak var labelKapitel: UILabel!
    @IBOutlet weak var labelBuch: UILabel!
    @IBOutlet weak var buttonKapitelVor: UIButton!
    @IBOutlet weak var buttonKapitelZurueck: UIButton!
    
    @IBAction func readTextAloud(_ sender: Any) {
        /*let germanVoice = AVSpeechSynthesisVoice(language: "de-DE")
        if germanVoice == nil {
            print("German voice not available")
        } else {
            print("German voice is available")
        }
        
        if #available(iOS 10.0, *) {
            if AVSpeechSynthesisVoice.self != nil {
                print("Speech synthesis is supported on this device.")
            } else {
                print("Speech synthesis is not supported on this device.")
            }
        } else {
            print("Speech synthesis is not supported on this device.")
        }*/

        guard let text = textViewKapiteltext.text else { return }
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: text)
            
            // Set the desired speech settings (optional)
            speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
            
            // Speak the text
            speechSynthesizer.speak(speechUtterance)
    }
    
    @IBAction func buttonKapitelVorClicked() {
        if randomInt < randomBibelstelle.count {
            randomInt = randomInt + 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
            textViewKapiteltext.scrollRangeToVisible(NSRange(location: 0, length: 0))
        }
    }
    
    @IBAction func buttonKapitelZurueckClicked() {
        if randomInt > 1 {
            randomInt = randomInt - 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
            textViewKapiteltext.scrollRangeToVisible(NSRange(location: 0, length: 0))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fontSize = UserDefaults.standard.double(forKey: "Fontsize")
        let newFont = textViewKapiteltext.font?.withSize(fontSize)
        textViewKapiteltext.font = newFont
        //textViewKapiteltext.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelKapitel.numberOfLines = 0
        labelKapitel.sizeToFit()
        //[labelKapitel.sizeToFit]
        labelBuch.numberOfLines = 0
        labelBuch.sizeToFit()
        
        buttonKapitelVor.layer.cornerRadius = 10
        buttonKapitelZurueck.layer.cornerRadius = 10
        
        randomInt = Int.random(in: 0..<randomBibelstelle.count)
        self.navigationItem.title = randomBibelstelle[randomInt].Buchname
        labelBuch.text = randomBibelstelle[randomInt].Buch
        labelKapitel.text = randomBibelstelle[randomInt].Kapitel
        textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        
    }
}
