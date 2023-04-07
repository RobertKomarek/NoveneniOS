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
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                jsonResult = try! JSONDecoder().decode([BibelStelle].self, from: data)
            } catch {
                // handle error
            }
        }
        return jsonResult
    }

}


