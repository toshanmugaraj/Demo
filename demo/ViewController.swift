//
//  ViewController.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView?
    private var tableData: Country?
    
    enum Constants {
        static let jsonURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        static let identifier = "customCellReuseIdentifier"
    }
    
    override func loadView() {
        super.loadView()
        guard let appDeleagte = UIApplication.shared.delegate as? AppDelegate, let window = appDeleagte.window else { return }
        self.view = View.init(frame:window.bounds)
        let customView = self.view as? View
        tableView = customView?.tableView
        self.view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let contentProvider = ContentProvider()
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCell()
        contentProvider.getContent(urlString: Constants.jsonURL) {[weak self] (result) in
            self?.tableData = result
            self?.tableView?.reloadData()
        }
    }
    
    private func registerCell() {
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(CustomTableViewCell.self, forCellReuseIdentifier: Constants.identifier)
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = tableData?.rows?[indexPath.row].title
        cell.detailLabel.text = tableData?.rows?[indexPath.row].description
        if let imageURLString = tableData?.rows?[indexPath.row].imageHref, let imageURL = URL(string: imageURLString) {
                cell.sdImageView.sd_setImage(with: imageURL, placeholderImage: nil, options: .progressiveDownload, completed: nil)
        }
        cell.layoutIfNeeded()
        return cell
    }

}

