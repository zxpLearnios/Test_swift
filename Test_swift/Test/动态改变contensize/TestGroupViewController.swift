//
//  TestGroupViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/1/18.
//

import UIKit

class TestGroupViewController: UIViewController {

    
    let tableview = UITableView.init(frame: .zero, style: .grouped)
    let cellId = "TestViewCell_id"
    
    let ary = [["色和计划外安慰人流护士色人生姛空间都气回复你", "00000000"], ["uuuuuuuuuuuuu哈哈哈看看就好收费金合欢花惊恐万分", "i开设凤凰科技工业万分魔刹石空间划分表", "111111111111111111"], ["222222", "已无任何为借口让亏损才能够让你充值卡"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    

    private func setup() {
        view.backgroundColor = .white
        tableview.backgroundColor = .gray
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        
        
        tableview.sectionHeaderHeight = 40
        tableview.sectionFooterHeight = 0.01
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = UITableView.automaticDimension
        tableview.register(TestViewCell.self, forCellReuseIdentifier: cellId)
    }

}


extension TestGroupViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        NSLog("滚动了：%f", scrollView.contentOffset.y)
    }
    
}

extension  TestGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ary.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TestViewCell
        let section = indexPath.section
        let row = indexPath.row
        cell.setTitle(ary[section][row])
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labe = UILabel()
        labe.backgroundColor = .white
        labe.text = String.init(format: "第%d个headerd", section)
        return labe
    }
    
    
    
}



