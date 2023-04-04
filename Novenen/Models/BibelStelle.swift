import UIKit

public struct BibelStelle : Decodable {
    
    var LfdNr : Int?
    var Id : String?
    var Buchname : String?
    var Buch : String?
    var Kapitel : String?
    var Kapiteltext : String?
    
    public func getBibelstelle(jsonName:String) -> [BibelStelle] {
        
        var jsonResult:[BibelStelle] = []
        //var bibelStelle:[BibelStelle] = []
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                jsonResult = try! JSONDecoder().decode([BibelStelle].self, from: data)
            } catch {
                // handle error
            }
        }
       
        
        /*let randomInt = Int.random(in: 0..<jsonResult.count)
        bibelStelle.append(BibelStelle(Buchname: jsonResult[randomInt].Buchname, Buch: jsonResult[randomInt].Buch, Kapitel: jsonResult[randomInt].Kapitel, Kapiteltext: jsonResult[randomInt].Kapiteltext))
        
        return bibelStelle*/
        
        return jsonResult
    }

}


