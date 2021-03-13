//
//  TestViewControlller.swift
//  
//
//  Created by bavaria on 2021/1/18.
//


import UIKit
import SnapKit


class TestViewControlller: UIViewController {

    
    let tableview = UITableView()
    let cellId = "TestViewCell_id"
    
    var ary = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableview.backgroundColor = .gray
        view.addSubview(tableview)
        
        // 1.
        tableview.rowHeight = 150
        tableview.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        // 2.
        
//        tableview.snp.makeConstraints { (make) in
//            make.center.equalTo(view)
//            make.left.right.equalTo(0)
//            make.height.equalTo(20)
//        }
//        tableview.rowHeight = UITableView.automaticDimension
//        tableview.estimatedRowHeight = 20
        
        
//        tableview.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.register(TestViewCell.self, forCellReuseIdentifier: cellId)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            
            
            // 1.
            
//                self.ary = ["111111111", "组织者身份嗯嗯组织者身份嗯嗯组织者身份嗯嗯", "33333333333333eeeeeeeeeeeeeeeeeeeeeeee", "44444"]
//                self.tableview.reloadData()
            
//            var height: CGFloat = self.tableview.rect(forSection: 0).size.height
////            for cell in cellAry {
////                height += cell.frame.size.height
////            }
//
//            self.tableview.snp.updateConstraints{ (make) in
//                make.height.equalTo(height)
//            }
            
            // 2.
        }
        
        
       
    }
    
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            
            
            
        }
        
    }
    
    


}


extension TestViewControlller: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ary.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TestViewCell
        let row = indexPath.row
        cell.tag = row
//        cell.setTitle(ary[row] as! String)
        return cell
    }
    
    
    
}
