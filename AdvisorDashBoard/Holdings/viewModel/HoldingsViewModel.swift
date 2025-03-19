//
//  HoldingsViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

protocol HoldingsViewModelProtocol {
    
}

class HoldingsViewModel: HoldingsViewModelProtocol {
    private var holdings: [AccountSummaryModel.AccountSummary.Holding]
    
    init(holdings: [AccountSummaryModel.AccountSummary.Holding]) {
        self.holdings = holdings
    }
}
