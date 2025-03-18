//
//  FilterViewModel.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

protocol FilterViewModelProtocol {
    var currentSelection: FilterType { get }
    var userSelection: FilterType? { get }
    var shouldClearFilters: Bool { get }
    var rightButtonTitle: String { get }
    
    func setUserSelection(index: Int)
    func getCellTitle(index: Int) -> String
    func getCellSelected(index: Int) -> Bool
}

class FilterViewModel: FilterViewModelProtocol {
    var currentSelection: FilterType
    var userSelection: FilterType?
    
    var shouldClearFilters: Bool {
        return currentSelection == userSelection || userSelection == nil
    }

    var rightButtonTitle: String {
        return userSelection == currentSelection ? "Clear" : "Save"
    }
    
    init(currentSelection: FilterType) {
        self.currentSelection = currentSelection
    }
    
    func setUserSelection(index: Int) {
        userSelection = index == 0 ? .byName : .byAssets
    }
    
    func getCellTitle(index: Int) -> String {
        return index == 0 ? FilterType.byName.rawValue : FilterType.byAssets.rawValue
    }
    
    func getCellSelected(index: Int) -> Bool {
        let selection = userSelection != nil ? userSelection : currentSelection
        return selection == .byName && index == 0 || selection == .byAssets && index == 1
    }
}
