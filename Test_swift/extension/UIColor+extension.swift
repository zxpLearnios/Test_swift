//
//  UIColor+extension.swift
//  Test_swift
//
//  Created by iMac on 2022/6/28.
//

import UIKit

extension UIColor {
    
    class func rgba(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: a)
    }
    
    // MARK: 16 位颜色  传入：333333
    class func colorWithHexString(_ color: String, alpha: CGFloat = 1) -> UIColor {
        var cString: String = color.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cString.count < 6 {
            return .black
        }
        
        if cString.hasPrefix("0X") || cString.hasPrefix("0x") {
            cString = (cString as NSString).substring(from: 2)
        }
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }
        if cString.count != 6 {
            return .red
        }
        
        var range = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha/1.0)
    }
    
}
