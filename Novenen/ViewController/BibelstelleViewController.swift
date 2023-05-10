import UIKit
import DeviceKit

class BibelstelleViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageBible: UIImageView!
    @IBOutlet weak var buttonBibelstelleZiehen: UIButton!
    @IBOutlet weak var textViewBibelzitat: UITextView!
    
    var biblePanorama: [UIImage] = [UIImage(named: "biblePanorama1.jpg")!, UIImage(named: "biblePanorama2.jpg")!, UIImage(named: "biblePanorama3.jpg")!, UIImage(named: "biblePanorama4.jpg")!, UIImage(named: "biblePanorama5.jpg")!, UIImage(named: "biblePanorama6.jpg")!, UIImage(named: "biblePanorama7.jpg")!, UIImage(named: "biblePanorama8.jpg")!, UIImage(named: "biblePanorama9.jpg")!, UIImage(named: "biblePanorama10.jpg")!, UIImage(named: "biblePanorama11.jpg")!, UIImage(named: "biblePanorama12.jpg")!, UIImage(named: "biblePanorama13.jpg")!, UIImage(named: "biblePanorama14.jpg")!, UIImage(named: "biblePanorama15.jpg")!, UIImage(named: "biblePanorama16.jpg")!, UIImage(named: "biblePanorama17.jpg")!, UIImage(named: "biblePanorama18.jpg")!]
    
    override func viewDidLayoutSubviews() {
        textViewBibelzitat.centerVertically()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        imageBible.image = biblePanorama[Int.random(in: 0..<biblePanorama.count)]
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        /*let screen = UIScreen.main.bounds
        var gradientView = UIView(frame: CGRect(x: 0, y: 0, width: screen.size.width, height: screen.size.height))
        
          let gradientLayer:CAGradientLayer = CAGradientLayer()
          gradientLayer.frame.size = gradientView.frame.size
          gradientLayer.colors =
        [UIColor.lightGray.cgColor, UIColor.darkGray.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        //[UIColor.white.cgColor, UIColor.black.cgColor, UIColor.black.withAlphaComponent(1).cgColor]
          backgroundView.layer.addSublayer(gradientLayer)*/
        
        buttonBibelstelleZiehen.layer.cornerRadius = 10.0
        buttonBibelstelleZiehen.clipsToBounds = true
        
        textViewBibelzitat.text = "\"Bittet und es wird euch gegeben; sucht und ihr werdet finden; klopft an und es wird euch geöffnet (Matthäus 7,7 und Lukas 11,9)\"\n\n" +
        "\"HIMMLISCHER VATER, DEIN WORT IST MEINEM FUß EINE LEUCHTE, EIN LICHT FÜR MEINE PFADE (Psalm 119)\""
        //"Eine Möglichkeit von Gott eine Antwort in einer bestimmten Frage zu erhalten, ist z.B. das Aufschlagen der Bibel. Zuvor solltest Du ein Gebet verrichten:\n\n" +
     }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "zurück", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueRandomBibelstelle" {
            
            let bibelStelle = BibelStelle()
           var kompletteBibel = bibelStelle.getBibelstelle(jsonName: "Einheitsuebersetzung1980")
            
            var selectedBibelstelleVC = SelectedBibelstelleViewController()
            selectedBibelstelleVC = segue.destination as! SelectedBibelstelleViewController
            selectedBibelstelleVC.randomBibelstelle = kompletteBibel
        }
    }
}

extension UITextView {
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}


