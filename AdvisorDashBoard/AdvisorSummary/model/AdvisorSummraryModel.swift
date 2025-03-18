//
//  AdvisorSummraryModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//
struct AdvisorSummraryWrapper: Decodable {
    var advisors: [AdvisorSummraryModel]
    
    struct AdvisorSummraryModel: Decodable {
        var name: String
        var id: String
        var custodians: [Custodian]
        
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
}
