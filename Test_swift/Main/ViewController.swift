//
//  ViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/1/18.
//

import UIKit


class ViewController: UIViewController {
    
    var isAddSubVc = false
    
    let scroller = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isAddSubVc = true
        
        // lab
        let lab = UILabel()
        
        view.addSubview(scroller)
        scroller.addSubview(lab)
        scroller.delegate = self
//        scroller.bounces = false
        
        lab.textColor = .red
        lab.text = "11111"
        
        scroller.snp.makeConstraints { (make) in
            make.edges.equalTo(0);
        }
        lab.snp.makeConstraints { (make) in
            make.centerX.equalTo(0)
            make.top.equalTo(100)
        }
        
        scroller.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 200)
        
        if isAddSubVc {
            let nouseVc = UIViewController()
            nouseVc.view.backgroundColor = .gray
            nouseVc.view.frame = CGRect(x: 50, y: 100, width: 300, height: 500)
            
            // 2.
            addChild(nouseVc)
            view.addSubview(nouseVc.view)
            
            let testVc = TestDismissOneViewController()
            nouseVc.addChild(testVc)
            nouseVc.view.addSubview(testVc.view)
            testVc.view.backgroundColor = .red
            testVc.view.frame = CGRect(x: 50, y: 100, width: 100, height: 130)
            
            
            // 1. childVc
//            let testVc = TestDismissOneViewController()
//            addChild(testVc)
//            view.addSubview(testVc.view)
//            testVc.view.backgroundColor = .red
//            testVc.view.frame = CGRect(x: 50, y: 100, width: 100, height: 130)
        }
        
        
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(btnAction))
        scroller.addGestureRecognizer(tap)
        
        // 弹框
        
        var str = getNewString("111111")
        let hud = PKHUD.sharedHUD
        
        HUD.flash(.label(str), delay: 2)
    }

    var num = 0
    @objc func btnAction() {
        // 0.
        let nav = navigationController!
        // TestViewControlller  TestGroupViewController   TestRichMenuViewController
        let vc = TestRichMenuViewController()
        nav.pushViewController(vc, animated: true)
        
        // 1.
//        let nav = UINavigationController.init(rootViewController: TestDismissOneViewController())
//        nav.modalPresentationStyle = .overFullScreen
//        self.present(nav, animated: true, completion: nil)
    }
    
    
    private func getNewString(_ string: String) -> String {
        #if DEBUG
        return String.init(format: "debug-%@", string)
        #else
        return String.init(format: "release-%@", string)
        #endif
    }
    
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isScrollToBottom = (scrollView.contentOffset.y ==  scrollView.contentSize.height + scrollView.safeAreaInsets.bottom - scroller.bounds.size.height)
        let str = ""
        debugPrint("滚动----： %d", isScrollToBottom)
    }
    
}



class TestObject {
    
    
    var name = "123"
    
    private static let  obj = TestObject()
    class var shared: TestObject {
        return obj
    }
    
}
