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
    
    override func viewDidAppear(_ animated: Bool) {
        let fontSize = UserDefaults.standard.double(forKey: "Fontsize")
        let newFont = textViewLitanei.font?.withSize(fontSize)
        textViewLitanei.font = newFont
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = litaneiUeberschrift
        textViewLitanei.text = litanei

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
