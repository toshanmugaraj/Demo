//
//  View.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

class View: UIView {
    var tableView: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableFactory()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tableFactory()
    }
    
    private func tableFactory() {
        tableView = UITableView(frame: self.bounds, style: .plain)
        guard let tableView = tableView else { return }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        if #available(iOS 11, *) {
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            tableView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        }
    }
}
