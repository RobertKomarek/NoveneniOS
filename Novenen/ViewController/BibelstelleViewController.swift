import UIKit
//import DeviceKit

class BibelstelleViewController: UIViewController {
    
    @IBOutlet weak var buttonInfo: UIButton!
    @IBOutlet weak var imageBible: UIImageView!
    @IBOutlet weak var buttonBibelstelleZiehen: UIButton!
    
    var number: Int = 0
    
    @IBAction func infoButtonClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Info",
          message: "Bittet und es wird euch gegeben; sucht und ihr werdet finden; klopft an und es wird euch geöffnet (Matthäus 7,7 und Lukas 11,9)\n\nEine Möglichkeit, um von Gott eine Antwort auf eine persönliche Frage zu bekommen, ist das \"Ziehen\" einer Bibelstelle. Vorher solltest Du ein Gebet verrichten:\n\nHIMMLISCHER VATER, DEIN WORT IST MEINEM FUß EINE LEUCHTE, EIN LICHT FÜR MEINE PFADE (Psalm 119)\n\nQuelle: Einheitsübersetzung des Alten und Neuen Testaments von 1980"
              ,
              preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*let alert = UIAlertController(title: "Löschen", message: "Lesezeichen für \(lesezeichenDefaults[selectedRow!.row].Novene) an Tag  \(lesezeichenDefaults[selectedRow!.row].Tag) löschen?", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ja", style: UIAlertAction.Style.default, handler: deleteSelectedRow(alert:)))
    alert.addAction(UIAlertAction(title: "Nein", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)*/
    
    @IBAction func clicked(_ sender: Any) {
        
        imageBible.image = biblePanorama[number]
        number += 1
    }
    
    var biblePanorama: [UIImage] = [UIImage(named: "biblePanorama1.jpg")!, UIImage(named: "biblePanorama2.jpg")!, UIImage(named: "biblePanorama3.jpg")!, UIImage(named: "biblePanorama4.jpg")!, UIImage(named: "biblePanorama5.jpg")!, UIImage(named: "biblePanorama6.jpg")!, UIImage(named: "biblePanorama7.jpg")!, UIImage(named: "biblePanorama8.jpg")!, UIImage(named: "biblePanorama9.jpg")!, UIImage(named: "biblePanorama10.jpg")!, UIImage(named: "biblePanorama11.jpg")!, UIImage(named: "biblePanorama12.jpg")!, UIImage(named: "biblePanorama13.jpg")!, UIImage(named: "biblePanorama14.jpg")!, UIImage(named: "biblePanorama15.jpg")!, UIImage(named: "biblePanorama16.jpg")!, UIImage(named: "biblePanorama17.jpg")!, UIImage(named: "biblePanorama18.jpg")!, UIImage(named: "biblePanorama19.jpg")!, UIImage(named: "biblePanorama20.jpg")!, UIImage(named: "biblePanorama21.jpg")!, UIImage(named: "biblePanorama22.jpg")!, UIImage(named: "biblePanorama23.jpg")!, UIImage(named: "biblePanorama24.jpg")!, UIImage(named: "biblePanorama25.jpg")!, UIImage(named: "biblePanorama26.jpg")!, UIImage(named: "biblePanorama27.jpg")!, UIImage(named: "biblePanorama28.jpg")!, UIImage(named: "biblePanorama29.jpg")!, UIImage(named: "biblePanorama30.jpg")!, UIImage(named: "biblePanorama31.jpg")!, UIImage(named: "biblePanorama32.jpg")!, UIImage(named: "biblePanorama33.jpg")!, UIImage(named: "biblePanorama34.jpg")!, UIImage(named: "biblePanorama35.jpg")!, UIImage(named: "biblePanorama36.jpg")!, UIImage(named: "biblePanorama37.jpg")!, UIImage(named: "biblePanorama38.jpg")!, UIImage(named: "biblePanorama39.jpg")!, UIImage(named: "biblePanorama40.jpg")!, UIImage(named: "biblePanorama41.jpg")!, UIImage(named: "biblePanorama42.jpg")!, UIImage(named: "biblePanorama43.jpg")!, UIImage(named: "biblePanorama44.jpg")!, UIImage(named: "biblePanorama45.jpg")!, UIImage(named: "biblePanorama46.jpg")!, UIImage(named: "biblePanorama47.jpg")!, UIImage(named: "biblePanorama48.jpg")!, UIImage(named: "biblePanorama49.jpg")!, UIImage(named: "biblePanorama50.jpg")!, UIImage(named: "biblePanorama51.jpg")!, UIImage(named: "biblePanorama52.jpg")!, UIImage(named: "biblePanorama53.jpg")!, UIImage(named: "biblePanorama54.jpg")!, UIImage(named: "biblePanorama55.jpg")!, UIImage(named: "biblePanorama56.jpg")!, UIImage(named: "biblePanorama57.jpg")!, UIImage(named: "biblePanorama58.jpg")!, UIImage(named: "biblePanorama59.jpg")!, UIImage(named: "biblePanorama60.jpg")!, UIImage(named: "biblePanorama61.jpg")!, UIImage(named: "biblePanorama62.jpg")!, UIImage(named: "biblePanorama63.jpg")!, UIImage(named: "biblePanorama64.jpg")!, UIImage(named: "biblePanorama65.jpg")!, UIImage(named: "biblePanorama66.jpg")!, UIImage(named: "biblePanorama67.jpg")!, UIImage(named: "biblePanorama67.jpg")!, UIImage(named: "biblePanorama68.jpg")!, UIImage(named: "biblePanorama69.jpg")!, UIImage(named: "biblePanorama70.jpg")!, UIImage(named: "biblePanorama71.jpg")!, UIImage(named: "biblePanorama72.jpg")!, UIImage(named: "biblePanorama73.jpg")!, UIImage(named: "biblePanorama74.jpg")!, UIImage(named: "biblePanorama75.jpg")!, UIImage(named: "biblePanorama76.jpg")!, UIImage(named: "biblePanorama77.jpg")!, UIImage(named: "biblePanorama78.jpg")!, UIImage(named: "biblePanorama79.jpg")!, UIImage(named: "biblePanorama80.jpg")!, UIImage(named: "biblePanorama81.jpg")!, UIImage(named: "biblePanorama82.jpg")!, UIImage(named: "biblePanorama83.jpg")!, UIImage(named: "biblePanorama84.jpg")!, UIImage(named: "biblePanorama85.jpg")!, UIImage(named: "biblePanorama86.jpg")!, UIImage(named: "biblePanorama87.jpg")!, UIImage(named: "biblePanorama88.jpg")!, UIImage(named: "biblePanorama89.jpg")!, UIImage(named: "biblePanorama90.jpg")!, UIImage(named: "biblePanorama91.jpg")!, UIImage(named: "biblePanorama92.jpg")!, UIImage(named: "biblePanorama93.jpg")!, UIImage(named: "biblePanorama94.jpg")!, UIImage(named: "biblePanorama95.jpg")!, UIImage(named: "biblePanorama96.jpg")!, UIImage(named: "biblePanorama97.jpg")!, UIImage(named: "biblePanorama98.jpg")!, UIImage(named: "biblePanorama99.jpg")!, UIImage(named: "biblePanorama100.jpg")!, UIImage(named: "biblePanorama101.jpg")!, UIImage(named: "biblePanorama102.jpg")!, UIImage(named: "biblePanorama103.jpg")!, UIImage(named: "biblePanorama104.jpg")!, UIImage(named: "biblePanorama105.jpg")!, UIImage(named: "biblePanorama106.jpg")!, UIImage(named: "biblePanorama107.jpg")!, UIImage(named: "biblePanorama108.jpg")!, UIImage(named: "biblePanorama109.jpg")!, UIImage(named: "biblePanorama110.jpg")!, UIImage(named: "biblePanorama111.jpg")!, UIImage(named: "biblePanorama112.jpg")!]
    
    
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
        buttonInfo.layer.cornerRadius = 10.0
        buttonInfo.clipsToBounds = true
        
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




