//
//  FilterTableViewCell.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setCell(text: String, selected: Bool) {
        filterLabel.text = text
        setSelected(selected: selected)
    }
    
    func setSelected(selected: Bool) {
        if selected {
            backgroundColor = UIColor.gray
            filterLabel.textColor = UIColor.white
        } else {
            backgroundColor = UIColor.white
            filterLabel.textColor = UIColor.black
        }
    }
}
