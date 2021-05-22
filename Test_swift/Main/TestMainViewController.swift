//
//  TestMainViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/5/11.
//

import UIKit

class TestMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        addBanner()
    }
    
    
    
    private func addBanner() {
        let newBanner = TLNewBannerView()
        view.addSubview(newBanner)
        
        newBanner.snp.makeConstraints { make in
            make.top.equalTo(300)
            make.left.right.equalTo(0)
            make.height.equalTo(200)
        }
    }
    
}
