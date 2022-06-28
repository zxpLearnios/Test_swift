//
//  TestRichMenuViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/3/13.
//  控制器里添加scroller，scroller里面添加多个字控制器；每个子控制器里添加scroller，scroller里面再添加多个字控制器。接口实现二级菜单里包含子菜单且都可以滑动切换; 嵌套

import UIKit

class TestRichMenuViewController: UIViewController {

    private let scroller = UIScrollView()
    private var childViewControlleAry = [UIViewController]()
    private var childViewControlleIndexAry = [Int]()
    
    
    lazy var firstSubVc: TestRichMenuSubViewController = {
        let vc = TestRichMenuSubViewController()
        vc.tag = 0
        return vc
    }()
    lazy var secondSubVc: TestRichMenuSubViewController = {
        let vc = TestRichMenuSubViewController()
        vc.tag = 1
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
        
        // 默认设置
        setupTitle(index: 0)
        setupChildViewControllers(index: 0)
    }
    
    /// 设置title
    private func setupTitle(index: Int) {
        title = "标题-\(index)"
    }
    
    // 数组子控制器并赋值
    private func setupChildViewControllers(index: Int) {
       
        let chilVCIndex = childViewControlleIndexAry.firstIndex(of: index)
        if chilVCIndex == nil || chilVCIndex == NSNotFound {
            var vc: TestRichMenuSubViewController!
            if index == 0 {
                vc = firstSubVc
            } else if index == 1 {
                vc = secondSubVc
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



extension TestRichMenuViewController: UIScrollViewDelegate {
    
    // MARK： UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        let page = Int(offsetX / scrollView.frame.width)
        
        setupTitle(index: page)
        setupChildViewControllers(index: page)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        
//        if !isscrollWhenTapSelectView { // 非点击后的滚动才去更新指示器
//            topSelectView.changeIndicatorPosition(with: Double(muti))
//        }
    }
}
