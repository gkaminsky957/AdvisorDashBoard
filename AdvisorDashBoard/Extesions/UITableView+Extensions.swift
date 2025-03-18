//
//  UITableView+Extensions.swift
//  AdvisorDashBoard
//
//  Created by Gennady Kaminsky on 3/18/25.
//
import UIKit

extension UITableView {
    func register(_ cellType: UITableViewCell.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: String(describing: cellType))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellType)) as! T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
    }
}
