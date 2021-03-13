//
//  UIImage+extension.swift
//  Test_swift
//
//  Created by bavaria on 2021/2/6.
//

import UIKit


extension UIImage {
    
    
    /**
     由Iconfont获取图片;
     1. 当tabbarItem的图片用此法获取时，颜色就会不起作用了，因为tabbar很特殊
     2. 当UIImageView的图片用此法获取时，字体大小就不起作用了，而frame起固定图片尺寸的作用
     - parameter content:    编码后的text 字体样式名字
     - parameter familyName: 字体库  不使用此参数时，此参数取默认
     - parameter size:       字体大小
     - parameter color:      字体颜色    不使用此参数时，此参数取默认
     
     - returns: 图片
     */
    static func if_image(withUniCode content: String, familyName: String = "iconfont", fontSize size: CGFloat, fontColor color: UIColor = .red) -> UIImage? {
        

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        
        var attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle: paragraph]
        
        if let font = UIFont(name: familyName, size: size) {
            attributes[NSAttributedString.Key.font] = font
        }
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), false, 0)
        
        let newStr = content as NSString
        newStr.draw(in: CGRect(x: 0, y: 0, width: size, height: size), withAttributes: attributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
