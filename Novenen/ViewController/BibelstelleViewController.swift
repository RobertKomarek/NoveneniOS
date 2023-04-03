//
//  BibelstelleViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 27.03.23.
//

import UIKit
import DeviceKit

class BibelstelleViewController: UIViewController {

    @IBOutlet weak var imageBible: UIImageView!
    @IBOutlet weak var buttonBibelstelleZiehen: UIButton!
    @IBOutlet weak var textViewBibelzitat: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBibelstelleZiehen.layer.cornerRadius = 10.0
        buttonBibelstelleZiehen.clipsToBounds = true
        
        textViewBibelzitat.text = "\"Bittet und es wird euch gegeben; sucht und ihr werdet finden; klopft an und es wird euch geöffnet (Matthäus 7,7 und Lukas 11,9)\"\n\n" +
        "Eine Möglichkeit von Gott eine Antwort in einer bestimmten Frage zu erhalten, ist z.B. das Aufschlagen der Bibel. Zuvor solltest Du ein Gebet verrichten:\n\n" +
        "\"HIMMLISCHER VATER, DEIN WORT IST MEINEM FUß EINE LEUCHTE, EIN LICHT FÜR MEINE PFADE (Psalm 119)\""
       
        
   
        /*let device = Device.current
        //print(device)
        //Bibel-Bild 20% vom Bildschirm
        if (device == .iPhone8 || device == .iPhoneSE || device == .iPhoneSE2 || device == .iPhoneSE3) {
            imageBible.frame = CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height * 0.2)
        } else {
            imageBible.frame = CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height * 0.3)
        }
        
        switch device {
        case .simulator(.iPhoneSE):
            let screenSize: CGRect = UIScreen.main.bounds
            imageBible.frame = CGRect(x: 0, y: 0, width: 0, height: screenSize.height * 0.2)
        case .simulator(.iPhoneSE2):
            let screenSize: CGRect = UIScreen.main.bounds
            imageBible.frame = CGRect(x: 0, y: 0, width: 0, height: screenSize.height * 0.2)
        case .simulator(.iPhoneSE3):
            let screenSize: CGRect = UIScreen.main.bounds
            imageBible.frame = CGRect(x: 0, y: 0, width: 0, height: screenSize.height * 0.2)
        case .simulator(.iPhone14ProMax):
            //let screenSize: CGRect = UIScreen.main.bounds
            imageBible.frame = CGRectMake(0, 0, 0, self.view.frame.height * 0.2)
        default:
            let screenSize: CGRect = UIScreen.main.bounds
            imageBible.frame = CGRect(x: 0, y: 0, width: 0, height: screenSize.height * 0.3)*/
        
        //labelBuchname.numberOfLines = 0
        //[labelBuchname.sizeToFit]
       
        
        //Autoheight for label
        //labelTagesueberschrift.numberOfLines = 0
        //[labelTagesueberschrift .sizeToFit]

       
    }
}
