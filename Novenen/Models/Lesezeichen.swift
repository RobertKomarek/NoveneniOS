import UIKit

struct Lesezeichen : Codable {
    
    var Novene : String?
    var Tag: String?
    
    init(Novene: String? = nil, Tag: String? = nil) {
        self.Novene = Novene
        self.Tag = Tag
    }

}
