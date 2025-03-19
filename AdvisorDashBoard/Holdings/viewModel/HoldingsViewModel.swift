//
//  HoldingsViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

protocol HoldingsViewModelProtocol {
    var totalNumberOfHoldings: Int { get }
    func getHolding(index: Int) -> AccountSummaryModel.AccountSummary.Holding?
}

class HoldingsViewModel: HoldingsViewModelProtocol {
    private var holdings: [AccountSummaryModel.AccountSummary.Holding]
    
    var totalNumberOfHoldings: Int {
        return holdings.count
    }
    
    init(holdings: [AccountSummaryModel.AccountSummary.Holding]) {
        self.holdings = holdings
    }
    
    func getHolding(index: Int) -> AccountSummaryModel.AccountSummary.Holding? {
        guard index >= 0 && index < holdings.count else {
            return nil
        }
        
        return holdings[index]
    }
}
