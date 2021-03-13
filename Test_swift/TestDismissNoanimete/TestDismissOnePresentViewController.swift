//
//  TestDismissOnePresentViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/2/27.
//

import UIKit

class TestDismissOnePresentViewController: UIViewController {

    var disMissClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        modalPresentationStyle = .overFullScreen
        
        let btn = UIButton()
        btn.setTitleColor(.red, for: .normal)
        btn.setTitle("点击", for: .normal)
        
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    }
    
    
    @objc private func btnAction() {
        
        
        let now = Date().timeIntervalSince1970;
        debugPrint("开始时间： \(now)")
        
        // 1.
        dismiss(animated: false) {
            let now = Date().timeIntervalSince1970;
            debugPrint("结束时间： \(now)")

            if let closure = self.disMissClosure {
                closure()
            }
        }
        
        
        // 2.
//        if let superVc = self.presentingViewController {
//            superVc.dismiss(animated: false, completion: nil)
//
//        }
//        dismiss(animated: false, completion: nil)
//
        // 3. 同时dismiss掉多个控制器;  跟一层一层回调是一样的，总会有一闪的感觉
        var vc : UIViewController = self
        while((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!
        }
        vc.dismiss(animated: false, completion: nil)
    }
}
