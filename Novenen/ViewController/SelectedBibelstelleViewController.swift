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
    
    @IBAction func buttonKapitelVor() {
        if randomInt < randomBibelstelle.count {
            randomInt = randomInt + 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        }
    }
    
    @IBAction func buttonKapitelZurueck() {
        if randomInt > 1 {
            randomInt = randomInt - 1
            self.navigationItem.title = randomBibelstelle[randomInt].Buchname
            labelBuch.text = randomBibelstelle[randomInt].Buch
            labelKapitel.text = randomBibelstelle[randomInt].Kapitel
            textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelKapitel.numberOfLines = 0
        [labelKapitel.sizeToFit]
        labelBuch.numberOfLines = 0
        [labelBuch.sizeToFit]
        
        randomInt = Int.random(in: 0..<randomBibelstelle.count)
        self.navigationItem.title = randomBibelstelle[randomInt].Buchname
        labelBuch.text = randomBibelstelle[randomInt].Buch
        labelKapitel.text = randomBibelstelle[randomInt].Kapitel
        textViewKapiteltext.text = randomBibelstelle[randomInt].Kapiteltext
        
    }
}
