//
//  AdvisorSummaryClient.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

import Foundation

protocol AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> AdvisorSummraryWrapper
}

class AdvisorSummaryClient: AdvisorSummaryClientProtocol {
    func getAdvisorClientSummary() async -> AdvisorSummraryWrapper {
        let filePath = Bundle.main.url(forResource: "MockAdvisorResponse", withExtension: "")!
        let data = try! Data(contentsOf: filePath)
        
        let decoder = JSONDecoder()
        return try! decoder.decode(AdvisorSummraryWrapper.self, from: data)
    }
}
