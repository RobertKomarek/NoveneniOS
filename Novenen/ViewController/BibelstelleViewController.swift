import UIKit
import DeviceKit

class BibelstelleViewController: UIViewController {

    @IBOutlet weak var imageBible: UIImageView!
    @IBOutlet weak var buttonBibelstelleZiehen: UIButton!
    
    //33 kann gelöscht bzw. durch ein neues Bild ersetzt werden. Duplikat von 9.
    var biblePanorama: [UIImage] = [UIImage(named: "biblePanorama1.jpg")!, UIImage(named: "biblePanorama2.jpg")!, UIImage(named: "biblePanorama3.jpg")!, UIImage(named: "biblePanorama4.jpg")!, UIImage(named: "biblePanorama5.jpg")!, UIImage(named: "biblePanorama6.jpg")!, UIImage(named: "biblePanorama7.jpg")!, UIImage(named: "biblePanorama8.jpg")!, UIImage(named: "biblePanorama9.jpg")!, UIImage(named: "biblePanorama10.jpg")!, UIImage(named: "biblePanorama11.jpg")!, UIImage(named: "biblePanorama12.jpg")!, UIImage(named: "biblePanorama13.jpg")!, UIImage(named: "biblePanorama14.jpg")!, UIImage(named: "biblePanorama15.jpg")!, UIImage(named: "biblePanorama16.jpg")!, UIImage(named: "biblePanorama17.jpg")!, UIImage(named: "biblePanorama18.jpg")!, UIImage(named: "biblePanorama19.jpg")!, UIImage(named: "biblePanorama20.jpg")!, UIImage(named: "biblePanorama21.jpg")!, UIImage(named: "biblePanorama22.jpg")!, UIImage(named: "biblePanorama23.jpg")!, UIImage(named: "biblePanorama24.jpg")!, UIImage(named: "biblePanorama25.jpg")!, UIImage(named: "biblePanorama26.jpg")!, UIImage(named: "biblePanorama27.jpg")!, UIImage(named: "biblePanorama27.jpg")!, UIImage(named: "biblePanorama28.jpg")!, UIImage(named: "biblePanorama29.jpg")!, UIImage(named: "biblePanorama30.jpg")!, UIImage(named: "biblePanorama31.jpg")!, UIImage(named: "biblePanorama32.jpg")!, UIImage(named: "biblePanorama33.jpg")!, UIImage(named: "biblePanorama34.jpg")!, UIImage(named: "biblePanorama35.jpg")!, UIImage(named: "biblePanorama36.jpg")!, UIImage(named: "biblePanorama37.jpg")!, UIImage(named: "biblePanorama38.jpg")!, UIImage(named: "biblePanorama39.jpg")!, UIImage(named: "biblePanorama40.jpg")!, UIImage(named: "biblePanorama41.jpg")!, UIImage(named: "biblePanorama42.jpg")!]
    
    
    
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
        
     }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "zurück", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueRandomBibelstelle" {
            
            let bibelStelle = BibelStelle()
            let kompletteBibel = bibelStelle.getBibelstelle(jsonName: "Einheitsuebersetzung1980")
            
            var selectedBibelstelleVC = SelectedBibelstelleViewController()
            selectedBibelstelleVC = segue.destination as! SelectedBibelstelleViewController
            selectedBibelstelleVC.randomBibelstelle = kompletteBibel
        }
    }
}




