import UIKit

class SelectedBibelstelleViewController: UIViewController {
    
    var randomBibelstelle : [BibelStelle] = []
    
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var KapitelText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Buchname = randomBibelstelle[0].Buchname
        Buch = randomBibelstelle[0].Buch
        Kapitel = randomBibelstelle[0].Kapitel
        KapitelText = randomBibelstelle[0].KapitelText
        //print(KapitelText)
        //print("TEST")
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
