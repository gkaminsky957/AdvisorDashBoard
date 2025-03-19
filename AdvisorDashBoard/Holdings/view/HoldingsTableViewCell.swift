//
//  HoldingsTableViewCell.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class HoldingsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var price: UILabel!
    
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
    
    func setCell(model: AccountSummaryModel.AccountSummary.Holding) {
        name.text = model.name
        number.text = String(model.units)
        price.text = String(model.price)
    }
}
