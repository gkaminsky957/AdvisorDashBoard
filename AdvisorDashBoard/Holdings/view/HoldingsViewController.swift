//
//  HoldingsViewController.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class HoldingsViewController: UIViewController {

    private var viewModel: HoldingsViewModelProtocol!
    
    func inject(viewModel: HoldingsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Holdings Summary"
    }
}
