//
//  AccountSummaryViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

protocol AccountSummaryViewModelProtocol {
    func fetchAccountSummary() async
}

class AccountSummaryViewModel: AccountSummaryViewModelProtocol {
    private var advisorId: String
    private var client: AccountSummaryClientProtocol
    private var summaries: [AccountSummaryModel.AccountSummary] = []
    
    init(advisorId: String,
        client: AccountSummaryClientProtocol = AccountSummaryClient()) {
        self.advisorId = advisorId
        self.client = client
    }
    
    func fetchAccountSummary() async {
        summaries = await client.getAccountSummary(advisorId: advisorId).accounts
        print("account summaris=\(summaries)")
    }
}

