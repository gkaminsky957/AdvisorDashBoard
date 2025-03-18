//
//  FilterViewController.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

protocol FilterViewControllerDelegateProtocol: AnyObject {
    func setFilter(filterType: FilterType)
    func clearFilter()
}

class FilterViewController: UIViewController {

    @IBOutlet weak var rightButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private var currentSelection: FilterType!
    private var userSelection: FilterType!
    private weak var delegate: FilterViewControllerDelegateProtocol!
    
    @IBAction func cancelButonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func rightButtonPressed(_ sender: UIBarButtonItem) {
        if currentSelection == userSelection || userSelection == nil {
            delegate?.clearFilter()
        } else {
            delegate?.setFilter(filterType: userSelection)
        }
        dismiss(animated: true)
    }
    
    func install(currentSelection: FilterType,
                 delegate: FilterViewControllerDelegateProtocol) {
        self.currentSelection = currentSelection
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Filter"
        tableView.register(FilterTableViewCell.self)
        setRightButtonOnLoad()
    }
}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(FilterTableViewCell.self)
        let selection = userSelection != nil ? userSelection : currentSelection
        cell.setCell(text: indexPath.row == 0 ? FilterType.byName.rawValue : FilterType.byAssets.rawValue,
                     selected: selection == .byName && indexPath.row == 0 ||
                               selection == .byAssets && indexPath.row == 1)
        
        return cell
    }
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            userSelection = .byName
        } else {
            userSelection = .byAssets
        }
        
        setRightButton()
        
        tableView.reloadData()
    }
}

private extension FilterViewController {
    func setRightButtonOnLoad() {
        if currentSelection != FilterType.none {
            rightButton.title = "Clear"
            rightButton.isHidden = false
        } else {
            rightButton.isHidden = true
        }
    }
    
    func setRightButton() {
        rightButton.isHidden = false
        if userSelection == currentSelection {
            rightButton.title = "Clear"
        } else {
            rightButton.title = "Save"
        }
    }
}
