//
import UIKit

class MyTableViewCell : UITableViewCell {
    
    @IBOutlet weak var stepperTag: UIStepper!
    @IBOutlet weak var labelNovenenTag: UILabel!
    @IBOutlet weak var labelNovenenName: UILabel!
 }

class LesezeichenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var pickerViewLesezeichenHinzufuegen: UIPickerView!
    @IBOutlet weak var buttonLesezeichenHinzufuegen: UIButton!
    @IBOutlet weak var tableViewBookmarks: UITableView!
    
    var pickerData: [String] = ["Fatima", "Franz von Sales", "Göttliche Barmherzigkeit", "Heiliger Geist", "Heiliger Josef", "Kostbares Blut", "Lourdes", "Medjugorje", "Mutter der immerwährenden Hilfe", "Sieben Zufluchten", "Unbefleckte Empfängnis"]
    
    var pickerTage: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewBookmarks.delegate = self
        tableViewBookmarks.dataSource = self
        
        pickerViewLesezeichenHinzufuegen.delegate = self
        pickerViewLesezeichenHinzufuegen.dataSource = self
        
        buttonLesezeichenHinzufuegen.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    let rainbow: [UIColor] = [.red, .yellow, .green, .orange, .blue, .purple, .magenta]
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        <#code#>
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rainbow.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewBookmarks.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewBookmarks.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        cell.backgroundColor = rainbow[indexPath.item]
        
        //Default Content Configuration
       var content = cell.defaultContentConfiguration()
       content.text = rainbow[indexPath.item].accessibilityName.capitalized
       cell.contentConfiguration = content
        
        return cell
    }*/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component ==  0 {
            return pickerData.count
        } else {
            return pickerTage.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component ==  0 {
            return pickerData[row]
        } else {
            return pickerTage[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 300.0
        } else {
            return 55.0
        }
    }
}
