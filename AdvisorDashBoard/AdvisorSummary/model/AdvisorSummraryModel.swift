//
//  AdvisorSummraryModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

struct AdvisorSummraryModel: Decodable {
    var name: String
    var id: String
    var custodians: [Custodian]
    
    init(name: String,
         id: String = "",
         custodians: [Custodian]) {
        self.name = name
        self.id = id
        self.custodians = custodians
    }
    
    struct Custodian: Decodable {
        var name: String
        var id: String
        
        init(name: String,
             id: String = "") {
            self.name = name
            self.id = id
        }
        
        enum CodingKeys: String, CodingKey {
            case name
            case id = "repId"
        }
    }
}
