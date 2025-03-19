//
//  AdvisorSummaryViewController.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

import UIKit

class AdvisorSummaryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    @IBAction func filterButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "FilterViewControllerIdentifier", sender: nil)
    }
    
    private var viewModel: AdvisorSummaryViewModelProtocol = AdvisorSummaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Advisor Summary"
        tableView.register(AdvisorSumaryTableViewCell.self)
        filterButton.isEnabled = false
        
        Task {
            await viewModel.fetchAdvisorSummary()
            filterButton.isEnabled = viewModel.filterButtonEnabled
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        switch destination {
        case is UINavigationController:
            if let navController = destination as? UINavigationController, let vc = navController.viewControllers.last as? FilterViewController {
                vc.inject(viewModel: viewModel.getFilterViewModel(),
                           delegate: self)
            }
        case is AccountSummaryViewController:
            if let vc = destination as? AccountSummaryViewController, let index = sender as? Int {
                vc.inject(viewModel: viewModel.getAccountSummaryViewModel(index: index))
            }
        default: break
        }
        
    }
}

extension AdvisorSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalNumberOfAdvisorSummaries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AdvisorSumaryTableViewCell.self)
        
        guard let model = viewModel.getAdvisorSummary(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setCell(model: model)
        return cell
    }
}

extension AdvisorSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AccountSummaryViewControllerIdentifier", sender: indexPath.row)
    }
}

extension AdvisorSummaryViewController: FilterViewControllerDelegateProtocol {
    func setFilter(filterType: FilterType) {
        viewModel.setFilters(filterType: filterType)
        tableView.reloadData()
    }
    
    func clearFilter() {
        viewModel.resetFilters()
        tableView.reloadData()
    }
}

