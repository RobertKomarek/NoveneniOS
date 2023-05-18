import UIKit

class SelectedBibelstelleViewController: UIViewController {
    
    var randomBibelstelle : [BibelStelle] = []
    
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var KapitelText : String?
    var randomInt : Int = 0
    
    @IBOutlet weak var textViewKapiteltext: UITextView!
    @IBOutlet weak var labelKapitel: UILabel!
    @IBOutlet weak var labelBuch: UILabel!
    @IBOutlet weak var buttonKapitelVor: UIButton!
    @IBOutlet weak var buttonKapitelZurueck: UIButton!
    
    @IBAction func buttonKapitelVorClicked() {
        if randomInt < randomBibelstelle.count {
            randomInt = randomInt + 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        }
    }
    
    @IBAction func buttonKapitelZurueckClicked() {
        if randomInt > 1 {
            randomInt = randomInt - 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let fontSize = UserDefaults.standard.double(forKey: "Fontsize")
        let newFont = textViewKapiteltext.font?.withSize(fontSize)
        textViewKapiteltext.font = newFont
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelKapitel.numberOfLines = 0
        [labelKapitel.sizeToFit]
        labelBuch.numberOfLines = 0
        [labelBuch.sizeToFit]
        
        buttonKapitelVor.layer.cornerRadius = 10
        buttonKapitelZurueck.layer.cornerRadius = 10
        
        randomInt = Int.random(in: 0..<randomBibelstelle.count)
        self.navigationItem.title = randomBibelstelle[randomInt].Buchname
        labelBuch.text = randomBibelstelle[randomInt].Buch
        labelKapitel.text = randomBibelstelle[randomInt].Kapitel
        textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        
    }
}
