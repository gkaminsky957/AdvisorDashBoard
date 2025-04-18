//
//  AccountSummaryTableViewCell.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class AccountSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var custodianName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func setCell(model: AccountSummaryModel.AccountSummary) {
        accountName.text = model.name
        accountNumber.text = model.number
        custodianName.text = model.custodian
    }
}
