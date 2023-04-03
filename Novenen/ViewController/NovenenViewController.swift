//
//  NovenenViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 27.03.23.
//

import UIKit

class NovenenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBAction func zurNoveneClicked(_ sender: UIButton, forEvent event: UIEvent) {
      
    }
   
    @IBOutlet weak var buttonZurNovene: UIButton!
    @IBOutlet weak var imageNovene: UIImageView!
    @IBOutlet weak var pickerViewNovenen: UIPickerView!
    @IBOutlet weak var labelDescriptionNovene: UILabel!
    
    let cornerRadius:CGFloat = 20.0
    var selectedNovene: String = ""
    
    var pickerData: [[String]] = [["Fatima", "5. bis 12. Mai"], ["Franz von Sales", "Novene zu Franz von Sales"], ["Göttliche Barmherzigkeit", "Karfreitag bis zum Vortag des Festes der göttlichen Barmherzigkeit (erster Sonntag nach Ostern)"], ["Heiliger Geist", "Von Christi Himmelfahrt bis Freitag vor Pfingsten"], ["Heiliger Josef", "10. bis 18. März"], ["Kostbares Blut", "Novene zum Kostbaren Blute Jesu Christi"], ["Lourdes", "Neun Tage vor einer Lourdes-Wallfahrt"], ["Medjugorje", "15. bis 24. Juni"], ["Mutter der immerwährenden Hilfe", "Eine Novene von P. Karl Jorda"], ["Sieben Zufluchten", "Novene zu den sieben Zufluchten"], ["Unbefleckte Empfängnis", "29. November bis 7. Dezember"]]
    
    var images: [UIImage] = [UIImage(named: "fatima.jpg")!, UIImage(named: "franzsales.jpg")!, UIImage(named: "kowalska.jpg")!, UIImage(named: "holyspirit.jpg")!, UIImage(named: "josef.jpg")!, UIImage(named: "kostbaresblut.jpg")!, UIImage(named: "lourdes.jpg")!, UIImage(named: "medjugorje.jpg")!, UIImage(named: "immerwaehrendehilfe.jpg")!, UIImage(named: "siebenzufluchten.jpg")!, UIImage(named: "immaculate.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerViewNovenen.delegate = self
        self.pickerViewNovenen.dataSource = self
        
        selectedNovene = pickerData[0][0]
        
        imageNovene.image = images[0]
        labelDescriptionNovene.text = pickerData[0][1]
        /*imageNovene.layer.cornerRadius = 20.0
        pickerViewNovenen.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]*/
        //Autoadjust height of label
        labelDescriptionNovene.numberOfLines = 0
        [labelDescriptionNovene .sizeToFit]
        labelDescriptionNovene.layer.cornerRadius = 10.0
        labelDescriptionNovene.clipsToBounds = true
        
        buttonZurNovene.layer.cornerRadius = 10.0
        buttonZurNovene.clipsToBounds = true
       
    }
    override func viewDidAppear(_ animated: Bool) {
        //Change text of Back Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Novenen", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNovene = pickerData[row][0]
        imageNovene.image = images[row]
        //Autoadjust height of label
        labelDescriptionNovene.numberOfLines = 0
        labelDescriptionNovene.text = pickerData[row][1]
        [labelDescriptionNovene .sizeToFit]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueZurNovene" {
            var selectedNoveneVC = SelectedNoveneViewController()
            selectedNoveneVC = segue.destination as! SelectedNoveneViewController
            
            var novene = Novene()
            switch selectedNovene {
            case "GöttlicheBarmherzigkeit":
                selectedNoveneVC.passedNovene = novene.GoettlicheBarmherzigkeitsNovene()
            default:
                selectedNoveneVC.passedNovene = novene.GoettlicheBarmherzigkeitsNovene()
            }
            //selectedNoveneVC.passedNovene = test
        }
    }

}


