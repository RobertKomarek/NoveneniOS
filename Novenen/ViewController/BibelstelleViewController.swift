import UIKit
import DeviceKit

class BibelstelleViewController: UIViewController {

    @IBOutlet weak var imageBible: UIImageView!
    @IBOutlet weak var buttonBibelstelleZiehen: UIButton!
    @IBOutlet weak var textViewBibelzitat: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*var bibelStelle = BibelStelle()
        var randomBibelstelle = bibelStelle.getBibelstelle(jsonName: "Einheitsuebersetzung1980")*/
        
        buttonBibelstelleZiehen.layer.cornerRadius = 10.0
        buttonBibelstelleZiehen.clipsToBounds = true
        
        textViewBibelzitat.text = "\"Bittet und es wird euch gegeben; sucht und ihr werdet finden; klopft an und es wird euch geöffnet (Matthäus 7,7 und Lukas 11,9)\"\n\n" +
        "Eine Möglichkeit von Gott eine Antwort in einer bestimmten Frage zu erhalten, ist z.B. das Aufschlagen der Bibel. Zuvor solltest Du ein Gebet verrichten:\n\n" +
        "\"HIMMLISCHER VATER, DEIN WORT IST MEINEM FUß EINE LEUCHTE, EIN LICHT FÜR MEINE PFADE (Psalm 119)\""
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueRandomBibelstelle" {
            
            let bibelStelle = BibelStelle()
            var randomBibelstelle = bibelStelle.getBibelstelle(jsonName: "Einheitsuebersetzung1980")
            
            var selectedBibelstelleVC = SelectedBibelstelleViewController()
            selectedBibelstelleVC = segue.destination as! SelectedBibelstelleViewController
            selectedBibelstelleVC.randomBibelstelle = randomBibelstelle
        }
    }
}
