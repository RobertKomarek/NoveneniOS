//
//  ImpressumViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 27.03.23.
//

import UIKit

class ImpressumViewController: UIViewController {
    
    @IBOutlet weak var textViewBeispieltext: UITextView!
    
    @IBAction func stepperFontsizeChangedClicked(_ sender: UIStepper, forEvent event: UIEvent) {
        
        if UserDefaults.standard.object(forKey: "Fontsize") != nil {
            var defaultFontsize = UserDefaults.standard.double(forKey: "Fontsize")
            // Create a new UIFont object with the desired font size
            let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
            textViewBeispieltext.font = newFont
            //print(defaultFontsize)
            
            if sender.value == 1.0 {
                // Plus button was clicked
                defaultFontsize = defaultFontsize + 1.0
                let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
                textViewBeispieltext.font = newFont
                UserDefaults.standard.set(defaultFontsize, forKey: "Fontsize")
            }
            
            if sender.value == -1.0 {
                // Minus button was clicked
                defaultFontsize = defaultFontsize - 1.0
                let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
                textViewBeispieltext.font = newFont
                UserDefaults.standard.set(defaultFontsize, forKey: "Fontsize")
            }
        } else {
            var defaultFontsize = 24.0 //default Fontsize
            if sender.value == 1.0 {
                // Plus button was clicked
                defaultFontsize = defaultFontsize + 1.0
                let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
                textViewBeispieltext.font = newFont
                UserDefaults.standard.set(defaultFontsize, forKey: "Fontsize")
            }
            
            if sender.value == -1.0 {
                // Minus button was clicked
                defaultFontsize = defaultFontsize - 1.0
                let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
                textViewBeispieltext.font = newFont
                UserDefaults.standard.set(defaultFontsize, forKey: "Fontsize")
            }
        }
        // Update the stepper's tag with the current value for the next comparison
        sender.value = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "Fontsize") != nil {
            var defaultFontsize = UserDefaults.standard.double(forKey: "Fontsize")
            // Create a new UIFont object with the desired font size
            let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
            textViewBeispieltext.font = newFont
        }
    }
}
