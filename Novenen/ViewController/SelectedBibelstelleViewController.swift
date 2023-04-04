import UIKit

class SelectedBibelstelleViewController: UIViewController {
    
    var randomBibelstelle : [BibelStelle] = []
    
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var KapitelText : String?
    
    @IBOutlet weak var textViewKapiteltext: UITextView!
    @IBOutlet weak var labelKapitel: UILabel!
    @IBOutlet weak var labelBuch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelKapitel.numberOfLines = 0
        [labelKapitel.sizeToFit]
        labelBuch.numberOfLines = 0
        [labelBuch.sizeToFit]
        
        self.navigationItem.title = randomBibelstelle[0].Buchname

        labelBuch.text = randomBibelstelle[0].Buch
        labelKapitel.text = randomBibelstelle[0].Kapitel
        textViewKapiteltext.text = randomBibelstelle[0].Kapiteltext
        
    }
}
