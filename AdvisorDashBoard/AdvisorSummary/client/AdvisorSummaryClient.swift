//
//  AdvisorSummaryClient.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

protocol AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> [AdvisorSummraryModel]
}

class AdvisorSummaryClient: AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> [AdvisorSummraryModel] {
        return [  AdvisorSummraryModel(name: "Alen Harry",
                                       custodians: [
                                         AdvisorSummraryModel.Custodian(name: "Shwab"),
                                         AdvisorSummraryModel.Custodian(name: "Ameriprice"),
                                         AdvisorSummraryModel.Custodian(name: "another asset"),
                                       ]),
                  AdvisorSummraryModel(name: "Adolf Smith",
                                      custodians: [
                                        AdvisorSummraryModel.Custodian(name: "Shwab"),
                                        AdvisorSummraryModel.Custodian(name: "Ameriprice"),
                                      ]),
                
        ]
    }
}
