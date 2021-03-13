//
//  TestRichMenuListViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/3/13.
//

import UIKit

class TestRichMenuListViewController: UIViewController {

    var tag = 0 {
        didSet {
            lab.text = "TestRichMenuListViewController-\(tag)"
        }
    }
    
    private let lab = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(lab)
        lab.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
    }
    

    

}
