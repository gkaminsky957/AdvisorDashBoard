//
//  AdvisorSummaryViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

protocol AdvisorSummaryViewModelProtocol {
    var totalNumberOfAdvisorSummaries: Int { get }
    var filterButtonEnabled: Bool { get }
    var filterType: FilterType { get }
    func getAdvisorSummary(index: Int) -> AdvisorSummraryModel?
    func fetchAdvisorSummary() async
    func resetFilters()
    func setFilters(filterType: FilterType)
}

enum FilterType: String {
    case none = ""
    case byName = "By Name"
    case byAssets = "By Assets"
}

class AdvisorSummaryViewModel: AdvisorSummaryViewModelProtocol {
    private var client: AdvisorSummaryClientProtocol
    private var advisorSummaries: [AdvisorSummraryModel] = []
    private var filteredAdvisorSummaries: [AdvisorSummraryModel] = []
    
    var filterType: FilterType = .none
    
    var totalNumberOfAdvisorSummaries: Int {
        return filteredAdvisorSummaries.count
    }
    
    var filterButtonEnabled: Bool {
        return totalNumberOfAdvisorSummaries > 0
    }
    
    init(client: AdvisorSummaryClientProtocol = AdvisorSummaryClient()) {
        self.client = client
    }
    
    func fetchAdvisorSummary() async {
        advisorSummaries = await client.getAdvisorClientSummary()
        filteredAdvisorSummaries = advisorSummaries
    }
    
    func getAdvisorSummary(index: Int) -> AdvisorSummraryModel? {
        guard index >= 0 && index < filteredAdvisorSummaries.count else {
            return nil
        }
        return filteredAdvisorSummaries[index]
    }
    
    func resetFilters() {
        filteredAdvisorSummaries = advisorSummaries
        filterType = .none
    }
    
    func setFilters(filterType: FilterType) {
        self.filterType = filterType
        switch filterType {
        case .byName:
            filteredAdvisorSummaries.sort{ $0.name < $1.name }
        case .byAssets:
            filteredAdvisorSummaries.sort{ $0.custodians.count > $1.custodians.count }
        case .none:
            break
        }
    }
}
