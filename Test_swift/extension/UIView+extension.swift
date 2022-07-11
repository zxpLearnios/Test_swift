//
//  UIView+extension.swift
//  Test_swift
//
//  Created by bava on 2022/7/11.
//

import UIKit



extension UIView {
    
    /// 设置上面圆角
    @discardableResult func setCornerRadiusForTop(_ topCr: Double, layer : CALayer? = nil) -> CALayer {
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: topCr, height: topCr))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        
        let tmpLayer = layer == nil ? self.layer : layer!
        tmpLayer.mask = maskLayer
        return tmpLayer
    }
    
    /// 设置下面圆角
    @discardableResult func setCornerRadiusForBottom(_ bottomCr: Double, layer : CALayer? = nil) -> CALayer {
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: bottomCr, height: bottomCr))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        
        let tmpLayer = layer == nil ? self.layer : layer!
        tmpLayer.mask = maskLayer
        return tmpLayer
    }
    
    /// 设置 上下左右的 圆角，
    @discardableResult func setCornerRadiusFortopAndBottom(topLeft: Double = 0, topRigth: Double = 0, bottomLeft: Double = 0, bottomRight: Double = 0) {
        let maskPath = UIBezierPath()
        
        let width = self.frame.width
        let height = self.frame.height
        
        maskPath.move(to: CGPoint(x: bottomLeft, y: height))
        maskPath.addQuadCurve(to: CGPoint(x: 0, y: height - bottomLeft), controlPoint: CGPoint(x: 0, y: height))
        
        maskPath.addLine(to: CGPoint(x: 0, y: topLeft))
        maskPath.addQuadCurve(to: CGPoint(x: topLeft, y: 0), controlPoint: CGPoint(x: 0, y: 0))
        maskPath.addLine(to: CGPoint(x: width - topRigth, y: 0))
        
        maskPath.addQuadCurve(to: CGPoint(x: width, y: topRigth), controlPoint: CGPoint(x: width, y: 0))
        maskPath.addLine(to: CGPoint(x: width, y: height - bottomRight))
        maskPath.addQuadCurve(to: CGPoint(x: width - bottomRight, y: height), controlPoint: CGPoint(x: width, y: height))
        maskPath.addLine(to: CGPoint(x: bottomLeft, y: height))
        
        maskPath.stroke()
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    
}
