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
        let layer = self.layer
        layer.cornerRadius = 3
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.brown.cgColor
        layer.shadowOffset = CGSize(width: 1, height : 1.0)
        layer.shadowOpacity = 0.6
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
