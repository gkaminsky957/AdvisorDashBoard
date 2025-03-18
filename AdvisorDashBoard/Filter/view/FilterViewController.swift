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
    
    private var viewModel: FilterViewModelProtocol!
    private weak var delegate: FilterViewControllerDelegateProtocol!
    
    
    @IBAction func cancelButonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func rightButtonPressed(_ sender: UIBarButtonItem) {
        if  viewModel.shouldClearFilters {
            delegate?.clearFilter()
        } else {
            delegate?.setFilter(filterType: viewModel.userSelection!)
        }
        dismiss(animated: true)
    }
    
    func install(viewModel: FilterViewModelProtocol,
                 delegate: FilterViewControllerDelegateProtocol) {
        self.viewModel = viewModel
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
       
        cell.setCell(text: viewModel.getCellTitle(index: indexPath.row),
                     selected: viewModel.getCellSelected(index: indexPath.row))
        
        return cell
    }
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.setUserSelection(index: indexPath.row)
        
        setRightButton()
        
        tableView.reloadData()
    }
}

private extension FilterViewController {
    func setRightButtonOnLoad() {
        if viewModel.currentSelection != FilterType.none {
            rightButton.title = "Clear"
            rightButton.isHidden = false
        } else {
            rightButton.isHidden = true
        }
    }
    
    func setRightButton() {
        rightButton.isHidden = false
        rightButton.title = viewModel.rightButtonTitle
    }
}
