//
//  ErinnerungViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 13.04.23.
//

import UIKit

class ErinnerungViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var labelDatumNovene: UILabel!
    @IBOutlet weak var pickerNovenen: UIPickerView!
    @IBOutlet weak var buttonErinnerungBestaetigen: UIButton!
    
    var pickerData: [[String]] = [["Fatima", "5. bis 12. Mai"], ["Franz von Sales", "Novene zu Franz von Sales"], ["Göttliche Barmherzigkeit", "Karfreitag bis zum Vortag des Festes der göttlichen Barmherzigkeit (erster Sonntag nach Ostern)"], ["Heiliger Geist", "Von Christi Himmelfahrt bis Freitag vor Pfingsten"], ["Heiliger Josef", "10. bis 18. März"], ["Kostbares Blut", "Novene zum Kostbaren Blute Jesu Christi"], ["Lourdes", "Neun Tage vor einer Lourdes-Wallfahrt"], ["Medjugorje", "   "], ["Mutter der immerwährenden Hilfe", "Eine Novene von P. Karl Jordan"], ["Sieben Zufluchten", "Novene zu den sieben Zufluchten"], ["Unbefleckte Empfängnis", "29. November bis 7. Dezember"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerNovenen.delegate = self
        pickerNovenen.dataSource = self
        
        buttonErinnerungBestaetigen.layer.cornerRadius = 10
        buttonErinnerungBestaetigen.clipsToBounds = true
        
        labelDatumNovene.text = pickerData[0][1]

        // Do any additional setup after loading the view.
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
        labelDatumNovene.text = pickerData[row][1]
    }
}
