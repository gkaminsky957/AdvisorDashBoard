//
//  AccountSummaryClient.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//
import Foundation

protocol AccountSummaryClientProtocol {
    func getAccountSummary(advisorId: String) async -> AccountSummaryModel
}

class AccountSummaryClient: AccountSummaryClientProtocol {
    
    func getAccountSummary(advisorId: String) async -> AccountSummaryModel {
        let filePath = Bundle.main.url(forResource: "MockAccountSummaryResponseRepId\(advisorId)", withExtension: "")!
        let data = try! Data(contentsOf: filePath)
        
        let decoder = JSONDecoder()
        return try! decoder.decode(AccountSummaryModel.self, from: data)
    }
}
