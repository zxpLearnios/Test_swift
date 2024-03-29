//
//  ViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/1/18.
//

import UIKit


class ViewController: UIViewController {
    
    var isAddSubVc = false
    
    // sdwebimage加载网络gif
    let imgView = AnimatedImageView()
    let scroller = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let mainAry = [1, 2, 3, 4, 5]
//        let subAry = [3, 5]
//        for i in mainAry {
//            for j in subAry {
//                if i == j {
//                    debugPrint("main==sub  ---\(j)")
//                    break
//                } else {
//                    debugPrint("sub---\(j)")
//                }
//            }
//            debugPrint("main---\(i)")
//        }
        
        
        
        isAddSubVc = true
        
        addImage()
//        setScroller()
//        setChildrenVc()
        
        
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(btnAction))
        view.addGestureRecognizer(tap)
        
        // 弹框
        
//        var str = getNewString("111111")
//        let hud = PKHUD.sharedHUD
//
//        HUD.flash(.label(str), delay: 2)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 测试圆角
        // 1.
//        imgView.setCornerRadiusForTop(30)
//        // 2.
//        imgView.setCornerRadiusForBottom(10)
        // 3.
        imgView.setCornerRadiusFortopAndBottom(topLeft: 30, topRigth: 10, bottomLeft: 100, bottomRight: 20)
        
//        let topLayer = CALayer()
//        let bottomLayer = CALayer()
//
//        imgView.layer.addSublayer(topLayer)
//        imgView.layer.addSublayer(bottomLayer)
//
//        topLayer.backgroundColor = UIColor.blue.cgColor
//        bottomLayer.backgroundColor = UIColor.blue.cgColor
//
//        topLayer.frame = imgView.layer.bounds
//        bottomLayer.frame = imgView.layer.bounds
//
//        imgView.setCornerRadiusForTop(30, layer: topLayer)
//        imgView.setCornerRadiusForTop(10, layer: bottomLayer)
        
    }
    
    
    private func addImage() {
        // sdwebimage加载网络gif
        imgView.backgroundColor = .red
        view.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.top.equalTo(100)
            make.width.height.equalTo(250)
        }
        
        
        let imgPng = "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3765175808,3864809112&fm=26&gp=0.jpg"
        let imgGif = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180103%2F87c6ca450dfb4f1bb13ed453846baea4.gif&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1620443054&t=1e9f20749b75e9446d37eea7fe0f17a2"
        
        imgView.kf.setImage(with: URL(string: imgPng), placeholder: nil, options: .none) { result in
            _ = ""
            
            _ = ""
        }
        
        
        
    }
    
    private func setScroller() {
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
    }

    private func setChildrenVc() {
        
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
        
    }
    
    @objc func btnAction() {
        // 0.
        let nav = navigationController!
        // TestViewControlller  TestGroupViewController   TestRichMenuViewController TestSystemShareViewController  TSListViewController TestMainViewController
        let vc = TSListViewController()
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
