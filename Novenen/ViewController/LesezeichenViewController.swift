//
import UIKit

class MyTableViewCell : UITableViewCell {
   
    @IBOutlet weak var stepperTag: UIStepper!
    @IBOutlet weak var labelNovenenTagBezeichnung: UILabel!
    @IBOutlet weak var labelNovenenTag: UILabel!
    @IBOutlet weak var labelNovenenName: UILabel!
}

class LesezeichenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var novenen:[Novene] = []
    var pickerData:[String] = []
    var pickerTage: [Int] = [1,2,3,4,5,6,7,8,9]
    var lesezeichenNew: [Lesezeichen] = []
    var lesezeichenDefaults : [Lesezeichen] = []
    var selectedNovene: String = ""
    var selectedTag: Int = 0
    
    @IBOutlet weak var pickerViewLesezeichenHinzufuegen: UIPickerView!
    @IBOutlet weak var buttonLesezeichenHinzufuegen: UIButton!
    @IBOutlet weak var tableViewBookmarks: UITableView!
    
    @IBAction func stepperTagClicked(_ sender: Any, forEvent event: UIEvent) {
        
        let clickedStepper = sender as! UIStepper
        var currentDay = lesezeichenDefaults[clickedStepper.tag].Tag
        
        if clickedStepper.value == 0.0 && currentDay >= 2 {
            currentDay = currentDay - 1
            
            lesezeichenDefaults[clickedStepper.tag].Tag = currentDay
            
            tableViewBookmarks.reloadData()
            
            try? UserDefaults.standard.set(PropertyListEncoder().encode(lesezeichenDefaults), forKey: "Lesezeichen")
        }
        
        if clickedStepper.value == 1.0 && currentDay < 9 {
            currentDay = currentDay + 1
            lesezeichenDefaults[clickedStepper.tag].Tag = currentDay
            
            tableViewBookmarks.reloadData()
            
            try? UserDefaults.standard.set(PropertyListEncoder().encode(lesezeichenDefaults), forKey: "Lesezeichen")
        }
    }
    @IBAction func LesezeichenHinzufuegenClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Lesezeichen...", message: "...für \(selectedNovene) an Tag \(selectedTag) hinzufügen?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ja", style: UIAlertAction.Style.default, handler: alertHandler))
        alert.addAction(UIAlertAction(title: "Nein", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func alertHandler(alert: UIAlertAction!) {
        if let encoded = UserDefaults.standard.object(forKey: "Lesezeichen") as? Data {
            lesezeichenDefaults = try! PropertyListDecoder().decode([Lesezeichen].self, from: encoded)
        }
       
        lesezeichenDefaults.append(Lesezeichen(
            Novene:selectedNovene,
            Tag: selectedTag)
        )
        
        try? UserDefaults.standard.set(PropertyListEncoder().encode(lesezeichenDefaults), forKey: "Lesezeichen")
        
        tableViewBookmarks.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Lesezeichen laden
        if let encoded = UserDefaults.standard.object(forKey: "Lesezeichen") as? Data {
            lesezeichenDefaults = try! PropertyListDecoder().decode([Lesezeichen].self, from: encoded)
        }
        
        tableViewBookmarks.delegate = self
        tableViewBookmarks.dataSource = self
        pickerViewLesezeichenHinzufuegen.delegate = self
        pickerViewLesezeichenHinzufuegen.dataSource = self
        buttonLesezeichenHinzufuegen.layer.cornerRadius = 10
        
        //Load Novenen-Details
        if let path = Bundle.main.path(forResource: "Novenen", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                novenen = try! JSONDecoder().decode([Novene].self, from: data)
            } catch {
                // handle error
            }
        }
        
        //Get only Novenen-Namen for PickerView
        for novene in novenen {
            if novene.Tag != "Info zur Novene" {
                pickerData.append(novene.Novenenname!)
            }
        }
        
        //Filter out duplicates
        pickerData = Array(Set(pickerData))
        pickerData.sort()
        
        selectedNovene = pickerData[0]
        selectedTag = pickerTage[0]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lesezeichenDefaults.count == 0 {
            return 3
        } else {
            return lesezeichenDefaults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewBookmarks.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        if lesezeichenDefaults.count != 0 {
            let data = lesezeichenDefaults[indexPath.row]
            cell.labelNovenenName.text = data.Novene
            cell.labelNovenenTagBezeichnung.text = "Tag"
            cell.labelNovenenTag.text = String(data.Tag)
            cell.stepperTag.tag = indexPath.row
        } else {
            cell.labelNovenenName.text = "LEER"
            cell.labelNovenenTag.text = "LEER"
            cell.labelNovenenTagBezeichnung.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //Delete selected Row
    let selectedRow = tableViewBookmarks.indexPathForSelectedRow
    
    if lesezeichenDefaults.count != 0 {
        let alert = UIAlertController(title: "Löschen", message: "Lesezeichen für \(lesezeichenDefaults[selectedRow!.row].Novene) an Tag  \(lesezeichenDefaults[selectedRow!.row].Tag) löschen?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ja", style: UIAlertAction.Style.default, handler: deleteSelectedRow(alert:)))
        alert.addAction(UIAlertAction(title: "Nein", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
    
    func deleteSelectedRow(alert: UIAlertAction) {
        let selectedRow = tableViewBookmarks.indexPathForSelectedRow
        lesezeichenDefaults.remove(at: selectedRow!.row)
        tableViewBookmarks.reloadData()
        //Update UserDefaults
        try? UserDefaults.standard.set(PropertyListEncoder().encode(lesezeichenDefaults), forKey: "Lesezeichen")
    }
    
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedNovene = pickerData[row]
        } else {
            selectedTag = pickerTage[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component ==  0 {
            return pickerData[row]
        } else {
            return String(pickerTage[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 300.0
        } else {
            return 75.0
        }
    }
    
    
}
