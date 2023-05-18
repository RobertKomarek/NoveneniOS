//
//  LitaneiViewController.swift
//  Novenen
//
//  Created by Marina Komarek on 12.04.23.
//

import UIKit

class LitaneiViewController: UIViewController {
    
    var litanei:String?
    var litaneiUeberschrift:String?

    @IBOutlet weak var textViewLitanei: UITextView!
   
    override func viewWillAppear(_ animated: Bool) {
        let fontSize = UserDefaults.standard.double(forKey: "Fontsize")
        let newFont = textViewLitanei.font?.withSize(fontSize)
        textViewLitanei.font = newFont
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = litaneiUeberschrift
        textViewLitanei.text = litanei

    }
}
