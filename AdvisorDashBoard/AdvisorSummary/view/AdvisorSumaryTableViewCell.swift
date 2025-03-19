//
//  AdvisorSumaryTableViewCell.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/17/25.
//

import UIKit

class AdvisorSumaryTableViewCell: UITableViewCell {

    @IBOutlet weak var advisorName: UILabel!
    @IBOutlet weak var assets: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setCell(model: AdvisorSummraryWrapper.AdvisorSummraryModel) {
        advisorName.text = model.name
        var assets = ""
        model.custodians.forEach {
            assets = assets + "\($0.name), "
        }
        self.assets.text = String(assets.dropLast(2))
    }
}
