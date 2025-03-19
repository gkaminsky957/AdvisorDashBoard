//
//  ShadowView.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/19/25.
//

import UIKit

class ShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addShadow()
    }
    
    private func addShadow() {
        layer.cornerRadius = 3
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.brown.cgColor
        layer.shadowOffset = CGSize(width: 0, height : 1.0)
        layer.shadowOpacity = 0.6
    }
}
