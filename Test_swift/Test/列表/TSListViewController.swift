//
//  TSListViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/4/9.
//

import UIKit

class TSListViewController: UITableViewController {

    
    let cellId = "cell-id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
    }
    
    func setupSubview() {
        let lab = UILabel()
        lab.textColor = .red
        lab.backgroundColor = .gray
        lab.text = "333333333"
        view.addSubview(lab)
        lab.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.height.equalTo(200)
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        return cell!
    }
    
}

