//
//  AccountSummaryViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

protocol AccountSummaryViewModelProtocol {
    var totalNumberOFAccountSummaries: Int { get }
    func fetchAccountSummary() async
    func getAccountSummary(index: Int) -> AccountSummaryModel.AccountSummary?
}

class AccountSummaryViewModel: AccountSummaryViewModelProtocol {
    private var advisorId: String
    private var client: AccountSummaryClientProtocol
    private var summaries: [AccountSummaryModel.AccountSummary] = []
    
    var totalNumberOFAccountSummaries: Int {
        return summaries.count
    }
    
    init(advisorId: String,
        client: AccountSummaryClientProtocol = AccountSummaryClient()) {
        self.advisorId = advisorId
        self.client = client
    }
    
    func fetchAccountSummary() async {
        summaries = await client.getAccountSummary(advisorId: advisorId).accounts
    }
    
    func getAccountSummary(index: Int) -> AccountSummaryModel.AccountSummary? {
        guard index >= 0 && index < summaries.count else {
            return nil
        }
        return summaries[index]
    }
}

