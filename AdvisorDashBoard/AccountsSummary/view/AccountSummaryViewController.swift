//
//  AccountSummaryViewController.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: AccountSummaryViewModelProtocol!
    
    func inject(viewModel: AccountSummaryViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accounts Summary"
        
        
        tableView.register(AccountSummaryTableViewCell.self)
        
        Task {
            await viewModel.fetchAccountSummary()
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        switch destination {
        case is HoldingsViewController:
            if let vc = destination as? HoldingsViewController, let viewModel = sender as? HoldingsViewModelProtocol {
                vc.inject(viewModel: viewModel)
            }
        default: break
        }
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalNumberOFAccountSummaries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AccountSummaryTableViewCell.self)
        guard let model = viewModel.getAccountSummary(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setCell(model: model)
        
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HoldingsViewControllerIdentifier", sender: viewModel.getHoldingsViewModel(index: indexPath.row))
    }
}
