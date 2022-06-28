//
//  TestRichMenuSubViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/3/13.
//  嵌套

import UIKit

class TestRichMenuSubViewController: UIViewController {

    var tag = 0 {
        didSet {
            view.backgroundColor = (tag % 2 == 0) ? .red : .purple
        }
    }
    
    private let scroller = UIScrollView()
    private var childViewControlleAry = [UIViewController]()
    private var childViewControlleIndexAry = [Int]()
    
    
    private lazy var firstListVc: TestRichMenuListViewController = {
        let vc = TestRichMenuListViewController()
        vc.tag = 0
        vc.view.backgroundColor = .gray
        return vc
    }()
    private lazy var secondListVc: TestRichMenuListViewController = {
        let vc = TestRichMenuListViewController()
        vc.tag = 1
        vc.view.backgroundColor = .orange
        return vc
    }()
    private lazy var thirdListVc: TestRichMenuListViewController = {
        let vc = TestRichMenuListViewController()
        vc.tag = 2
        vc.view.backgroundColor = .green
        return vc
    }()
    private lazy var fourListVc: TestRichMenuListViewController = {
        let vc = TestRichMenuListViewController()
        vc.tag = 3
        vc.view.backgroundColor = .systemBlue
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        scroller.isPagingEnabled = true
        scroller.showsVerticalScrollIndicator = false
        scroller.showsHorizontalScrollIndicator = false
        scroller.contentSize = CGSize(width: view.width * 2, height: 0)
        scroller.delegate = self
        
        view.addSubview(scroller)
        scroller.frame = view.bounds
        
        setupChildViewControllers(index: 0)
    }
    
    
    // 数组子控制器并赋值
    private func setupChildViewControllers(index: Int) {
       
        let chilVCIndex = childViewControlleIndexAry.firstIndex(of: index)
        if chilVCIndex == nil || chilVCIndex == NSNotFound {
            var vc: TestRichMenuListViewController!
            
            if tag == 0 {
                if index == 0 {
                    vc = firstListVc
                } else if index == 1 {
                    vc = secondListVc
                }
            } else {
                if index == 0 {
                    vc = thirdListVc
                } else if index == 1 {
                    vc = fourListVc
                }
            }
            
            addChild(vc)
            scroller.addSubview(vc.view)
            let x = CGFloat(index) * scroller.width
            vc.view.frame = CGRect(x: x, y: 0, width: scroller.width, height: scroller.height)
            childViewControlleAry.append(vc)
            childViewControlleIndexAry.append(index)
            
        }
    }

}


extension TestRichMenuSubViewController: UIScrollViewDelegate {
    
    // MARK： UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        let page = Int(offsetX / scrollView.frame.width)
        
        
        setupChildViewControllers(index: page)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        
//        if !isscrollWhenTapSelectView { // 非点击后的滚动才去更新指示器
//            topSelectView.changeIndicatorPosition(with: Double(muti))
//        }
    }
}
