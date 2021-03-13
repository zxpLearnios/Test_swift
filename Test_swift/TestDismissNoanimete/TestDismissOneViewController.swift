//
//  TestDismissOneViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/2/27.
//

import UIKit

class TestDismissOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "导航栏"
        
        modalPresentationStyle = .overFullScreen
        
        view.backgroundColor = .white
        let btn = UIButton()
        btn.setTitleColor(.red, for: .normal)
        btn.setTitle("点击dismiss", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    

    @objc private func btnAction() {
        self.dismiss(animated: false) {
            debugPrint("\(self)---dismiss")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1. tabbarvc的子控制器 或者 tabbarvc的子控制器的字控制器 这个值都是存在的
//        self.tabBarController;
        
        let vc = TestDismissOnePresentViewController()
        vc.disMissClosure = {[weak self] in
            if let `self` = self {
                self.btnAction()
            }
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
