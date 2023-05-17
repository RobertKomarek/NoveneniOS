//
//  ImpressumViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 27.03.23.
//

import UIKit

class ImpressumViewController: UIViewController {

    @IBOutlet weak var textViewBeispieltext: UITextView!
    
    @IBAction func stepperSchriftgroesseClicked(_ sender: Any) {
        
        let stepper = sender as! UIStepper
        print(stepper.value)
        print(stepper.minimumValue)
        print(stepper.maximumValue)
        
        if stepper.value < stepper.minimumValue {
            //get current Font Size of Example Text
            if let font = textViewBeispieltext.font {
                var fontSize = font.pointSize
                fontSize = fontSize - 1.0
                // Create a new UIFont object with the desired font size
                let newFont = textViewBeispieltext.font?.withSize(fontSize)
                textViewBeispieltext.font = newFont
            }
        }
        
        if stepper.value > stepper.maximumValue {
            //get current Font Size of Example Text
            if let font = textViewBeispieltext.font {
                var fontSize = font.pointSize
                //print("current fontsize: \(fontSize)")
                fontSize = fontSize + 1.0
                //print("new fontsize: \(fontSize)")
                // Create a new UIFont object with the desired font size
                let newFont = textViewBeispieltext.font?.withSize(fontSize)
                textViewBeispieltext.font = newFont
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
