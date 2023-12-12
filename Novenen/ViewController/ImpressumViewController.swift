import UIKit
import MessageUI

class ImpressumViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var labelMailAddress: UILabel!
    @IBOutlet weak var textViewBeispieltext: UITextView!
    @IBAction func tapGestureMailAddress(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            mailComposeVC.setToRecipients(["robert.komarek98@gmail.com"])
            mailComposeVC.setSubject("Novenen-App für iOS")
            mailComposeVC.setMessageBody("Anfrage zur Novenen-App", isHTML: false)
            
            present(mailComposeVC, animated: true, completion: nil)
        } else {
            print("Mail-Service not available!")
        }
    }
    
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
            let defaultFontsize = UserDefaults.standard.double(forKey: "Fontsize")
            // Create a new UIFont object with the desired font size
            let newFont = textViewBeispieltext.font?.withSize(defaultFontsize)
            textViewBeispieltext.font = newFont
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // Dismiss the mail compose view controller when finished
        controller.dismiss(animated: true, completion: nil)
        
        // Handle the result of the email composition if needed
        switch result {
        case .cancelled:
            // Email composition was cancelled
            break
        case .sent:
            // Email was sent successfully
            break
        case .saved:
            // Email was saved as a draft
            break
        case .failed:
            // Email failed to send
            break
        default:
            break
        }
    }

}
