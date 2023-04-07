//
//  SelectedNoveneViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 31.03.23.
//

import UIKit

class SelectedNoveneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var passedNovene: [Novene] = []

    @IBOutlet weak var textViewNovene: UITextView!
    @IBOutlet weak var pickerViewTage: UIPickerView!
    @IBOutlet weak var labelTagesueberschrift: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerViewTage.dataSource = self
        self.pickerViewTage.delegate = self
        //TEST
        
        //Hintergrund-Transparenz der top Navigation Bar entfernen
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = passedNovene[0].Novenenname
        textViewNovene.text = passedNovene[0].Tagestext
        
        //Autoheight for label
        labelTagesueberschrift.numberOfLines = 0
        [labelTagesueberschrift .sizeToFit]
        labelTagesueberschrift.text = passedNovene[0].Tagesueberschrift
        
        //textViewNovene.layer.cornerRadius = 20.0
        //textViewNovene.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return passedNovene.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return passedNovene[row].Tag
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Autoadjust height of label
        labelTagesueberschrift.numberOfLines = 0
        labelTagesueberschrift.text = passedNovene[row].Tagesueberschrift
        [labelTagesueberschrift .sizeToFit]
        textViewNovene.text = passedNovene[row].Tagestext
         }

}
