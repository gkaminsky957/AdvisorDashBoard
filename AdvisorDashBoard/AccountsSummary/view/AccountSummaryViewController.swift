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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accounts Summary"
        
        
        tableView.register(AccountSummaryTableViewCell.self)
        
        Task {
            await viewModel.fetchAccountSummary()
        }
    }
    
    func inject(viewModel: AccountSummaryViewModelProtocol) {
        self.viewModel = viewModel
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AccountSummaryTableViewCell.self)
        
        return cell
    }
}
