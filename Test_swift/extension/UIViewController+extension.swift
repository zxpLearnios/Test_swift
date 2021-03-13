//
//  UIViewController+extension.swift
//  Test_swift
//
//  Created by bavaria on 2021/3/13.
//


import UIKit
import SnapKit

private var tapEdgeInsetskey = 0
extension UIView {
    
    ///  x值
    var x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
        
    }
    
    ///  y值
    var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
        
    }
    
    ///  宽度
    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        
    }
    
    ///  高度
    var height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
    }
    
    
    /// 安全区域: 上
    var safeAreaTop: ConstraintItem {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.snp.top
        } else {
            return snp.top
        }
    }
    
    var safeAreaBottom: ConstraintItem {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.snp.bottom
        } else {
            return snp.bottom
        }
    }
}
