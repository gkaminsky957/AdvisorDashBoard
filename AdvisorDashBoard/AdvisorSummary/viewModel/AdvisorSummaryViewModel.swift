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
    func getAdvisorSummary(index: Int) -> AdvisorSummraryWrapper.AdvisorSummraryModel?
    func fetchAdvisorSummary() async
    func resetFilters()
    func setFilters(filterType: FilterType)
    func getFilterViewModel() -> FilterViewModelProtocol
    func getAccountSummaryViewModel(index: Int) -> AccountSummaryViewModelProtocol
}

enum FilterType: String {
    case none = ""
    case byName = "By Name"
    case byAssets = "By Assets"
}

class AdvisorSummaryViewModel: AdvisorSummaryViewModelProtocol {
    private var client: AdvisorSummaryClientProtocol
    private var advisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    private var filteredAdvisorSummaries: [AdvisorSummraryWrapper.AdvisorSummraryModel] = []
    
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
        advisorSummaries = await client.getAdvisorClientSummary().advisors
        filteredAdvisorSummaries = advisorSummaries
    }
    
    func getAdvisorSummary(index: Int) -> AdvisorSummraryWrapper.AdvisorSummraryModel? {
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
            filteredAdvisorSummaries = advisorSummaries
            filteredAdvisorSummaries.sort{ $0.name < $1.name }
        case .byAssets:
            filteredAdvisorSummaries = advisorSummaries
            filteredAdvisorSummaries.sort{ $0.custodians.count > $1.custodians.count }
        case .none:
            break
        }
    }
    
    func getFilterViewModel() -> FilterViewModelProtocol {
        return FilterViewModel(currentSelection: filterType)
    }
    
    func getAccountSummaryViewModel(index: Int) -> AccountSummaryViewModelProtocol {
        let advisorSummaryModel = filteredAdvisorSummaries[index]
        return AccountSummaryViewModel(advisorId: advisorSummaryModel.id)
    }
}
