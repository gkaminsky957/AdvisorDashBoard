//
//  HoldingsViewController.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class HoldingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: HoldingsViewModelProtocol!
    
    func inject(viewModel: HoldingsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Holdings Summary"
        tableView.register(HoldingsTableViewCell.self)
        
        tableView.reloadData()
    }
}

extension HoldingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.totalNumberOfHoldings
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(HoldingsTableViewCell.self)
        
        guard let model = viewModel.getHolding(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setCell(model: model)
        return cell
    }
}
