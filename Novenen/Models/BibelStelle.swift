import UIKit

public struct BibelStelle : Decodable {
    
    var LfdNr : Int?
    var Id : String?
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var KapitelText : String?
    
    public func getBibelstelle(jsonName:String) -> [BibelStelle] {
        
        var jsonResult:[BibelStelle] = []
        var bibelStelle:[BibelStelle] = []
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                jsonResult = try! JSONDecoder().decode([BibelStelle].self, from: data)
            } catch {
                // handle error
            }
        }
        
        /*var test : [BibelStelle] = [
            BibelStelle(LfdNr: 1, Id: "1", Buchname: "Buchname", Buch: "Buch", Kapitel: "Kapitel", KapitelText: "Kapiteltext"),
            BibelStelle(LfdNr: 2, Id: "2", Buchname: "Buchname", Buch: "Buch", Kapitel: "Kapitel", KapitelText: "Kapiteltext"),
            BibelStelle(LfdNr: 3, Id: "3", Buchname: "Buchname", Buch: "Buch", Kapitel: "Kapitel", KapitelText: "Kapiteltext")
        ]*/
        
        let randomInt = Int.random(in: 0..<jsonResult.count)
        bibelStelle.append(BibelStelle(Buchname: jsonResult[randomInt].Buchname, Buch: jsonResult[randomInt].Buch, Kapitel: jsonResult[randomInt].Kapitel, KapitelText: jsonResult[randomInt].KapitelText))
        
        return bibelStelle
    }

}


