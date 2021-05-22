//
//  TLNewBannerView.swift
//  Test_swift
//
//  Created by bavaria on 2021/5/11.
//

import UIKit

class TLNewBannerViewOld: UIView {

    let imageNames = ["tl_left", "tl_center", "tl_right"]
    var imageViews = [UIImageView]()
    
    let leftImageView = UIImageView()
    let centerImageView = UIImageView()
    let rightImageView = UIImageView()
    
    let centerImageCoverView = UIView()
    
    /// 最开始的位置
    var firstStartPoint = CGPoint.zero
    /// 根据最开始的位置
    var isPanLeftForFirstPoint = false
    
    var lastPoint = CGPoint.zero
    /// 手势滑动的方向
    var isPanLeft = false
    /// 当前的索引
    var currentIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        imageViews.append(leftImageView)
        imageViews.append(centerImageView)
        imageViews.append(rightImageView)
        
        let leftImg = UIImage.init(named: imageNames[0])
        let centerImg = UIImage.init(named: imageNames[1])
        let rightImg = UIImage.init(named: imageNames[2])
        
//        leftImageView.image = leftImg
        centerImageView.image = centerImg
//        rightImageView.image = rightImg
        
        addSubview(leftImageView)
        addSubview(centerImageView)
        addSubview(rightImageView)
        
        leftImageView.snp.makeConstraints { make in
            make.right.equalTo(centerImageView.snp.left)
            make.top.bottom.width.equalTo(centerImageView)
        }
        centerImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self).offset(0)
            make.centerY.equalTo(0)
            make.width.height.equalTo(self)
        }
        rightImageView.snp.makeConstraints { make in
            make.left.equalTo(centerImageView.snp.right)
            make.top.bottom.width.equalTo(centerImageView)
        }
        
        
        leftImageView.backgroundColor = .gray
//        centerImageView.backgroundColor = .red
        rightImageView.backgroundColor = .blue
        
        addGesture()
    }
    
    private func addGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        addGestureRecognizer(pan)
    }
    
    
    @objc private func panAction(_ pan: UIPanGestureRecognizer) {
        let state = pan.state
        let point = pan.location(in: self)
        
        if state == .began {
            firstStartPoint = point;
            lastPoint = point
        } else if state == .changed {
            isPanLeft = lastPoint.x > point.x
            lastPoint = CGPoint(x: point.x, y: point.y)
            
            
            let panOffsetX = point.x - firstStartPoint.x
//            centerImageView.transform = CGAffineTransform.init(translationX: panOffsetX, y: 0)
            centerImageView.snp.updateConstraints{ make in
                make.centerX.equalTo(self).offset(panOffsetX)
            }
        } else if state == .cancelled || state == .ended || state == .failed {
            firstStartPoint = .zero
            lastPoint = .zero
            
            centerImageView.snp.updateConstraints{ make in
                make.centerX.equalTo(self).offset(0)
            }
//            centerImageView.transform = CGAffineTransform.identity
        }
        
        
//        debugPrint("手势的方向是：%@", isPanLeft ? "👈" : "👉")
        debugPrint("滚动距离为：%f", point.x - firstStartPoint.x)
    }
    
    deinit {
        debugPrint("\(self.classForCoder)---deinit")
    }
    
}
