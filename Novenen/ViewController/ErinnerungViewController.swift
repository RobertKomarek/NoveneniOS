import UIKit
import UserNotifications

class ErinnerungViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var imageCalender: UIImageView!
    @IBOutlet weak var labelDatumNovene: UILabel!
    @IBOutlet weak var pickerNovenen: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonErinnerungBestaetigen: UIButton!
    
    var selectedNovene: String = "Fatima" //Default value "Fatima"
    var selectedDate = Date()
    
    var pickerData: [[String]] = [["Fatima", "5. bis 12. Mai"], ["Franz von Sales", "Novene zu Franz von Sales"], ["Göttliche Barmherzigkeit", "Karfreitag bis zum Vortag des Festes der göttlichen Barmherzigkeit (erster Sonntag nach Ostern)"], ["Heiliger Geist", "Von Christi Himmelfahrt bis Freitag vor Pfingsten"], ["Heiliger Josef", "10. bis 18. März"], ["Kostbares Blut", "Novene zum Kostbaren Blute Jesu Christi"], ["Lourdes", "Neun Tage vor einer Lourdes-Wallfahrt"], ["Medjugorje", "15. bis 24. Juni"], ["Mutter der immerwährenden Hilfe", "Eine Novene von P. Karl Jordan"], ["Sieben Zufluchten", "Novene zu den sieben Zufluchten"], ["Unbefleckte Empfängnis", "29. November bis 7. Dezember"], ["Wunderbare Medaille", "Novene zu Ehren Unserer Lieben Frau von der Wunderbaren Medaille"]]
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCalender.alpha = 0.1
        
        pickerNovenen.delegate = self
        pickerNovenen.dataSource = self
        
        UNUserNotificationCenter.current().delegate = self
        
        buttonErinnerungBestaetigen.layer.cornerRadius = 10
        buttonErinnerungBestaetigen.clipsToBounds = true
        
        labelDatumNovene.text = pickerData[0][1]
        
        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("acces granted")
            } else {
                print("acces NOT granted")
                 /*let alertController = UIAlertController(title: "Info", message: "Es können keine Erinnerungen zu Beginn der jeweiligen Novene erfolgen. Sind Sie sich sicher?", preferredStyle: .alert)
                
                let JaAction = UIAlertAction(title: "JA", style: .default)
                
                let NeinAction = UIAlertAction(title: "NEIN", style: .default) {
                    (action:UIAlertAction!) in }
                
                alertController.addAction(JaAction)
                alertController.addAction(NeinAction)
                self.present(alertController, animated: true, completion: nil)*/
            }
        }
    }
    
    @IBAction func erinnnerungBestaetigen(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = formatter.string(from: datePicker.date)
        
        let alertController = UIAlertController(title: "Erinnerung", message: "Soll eine Erinnerung an die Novene \(selectedNovene) am \(dateString) Uhr erfolgen?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action:UIAlertAction!) in
            // Handle OK button action here
            self.selectedDate = self.datePicker.date
            let calendar = Calendar.current
            // Create a date components object for the date and time you want to send the notification
            var dateComponents = DateComponents()
            dateComponents.year = calendar.component(.year, from: self.selectedDate)
            dateComponents.month = calendar.component(.month, from: self.selectedDate)
            dateComponents.day = calendar.component(.day, from: self.selectedDate)
            dateComponents.hour = calendar.component(.hour, from: self.selectedDate)
            dateComponents.minute = calendar.component(.minute, from: self.selectedDate)
            //print ("\(dateComponents.year) \(dateComponents.month) \(dateComponents.day) \(dateComponents.hour) \(dateComponents.minute)")
            // Create a trigger for the notification based on the date components
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            // Create a content object for the notification
            let content = UNMutableNotificationContent()
            content.title = "Novenen"
            content.body = "Die Novene \(self.selectedNovene) beginnt heute!"
            content.sound = UNNotificationSound.default

            // Create a request for the notification
            let request = UNNotificationRequest(identifier: "novenenErinnerung", content: content, trigger: trigger)

            // Add the request to the notification center
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    // Handle the error
                } else {
                    // Notification was successfully scheduled
                }
            }
        }
        
        let CancelAction = UIAlertAction(title: "Abbrechen", style: .default)
        
        alertController.addAction(okAction)
        alertController.addAction(CancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //PickerView mit Novenen-Namen
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
        selectedNovene = pickerData[row][0]
        
        
    }
}
