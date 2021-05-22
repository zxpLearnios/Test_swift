//
//  TLNewBannerView.swift
//  Test_swift
//
//  Created by bavaria on 2021/5/11.
//  1. 仿爱奇艺的banner，手势滑动时，左右的透明度变化
//  2. 动画时禁止交互，动画结束允许交互
//  3. 图片数组个数必须>=2，目前只处理这种情况的；数组直接用，不需要格外在头部或尾部加数据
//  4. 已经自动循环数据源了; 私有手势都添加在self上而不是在图片上

import UIKit

class TLNewBannerView: UIView {

    var imageViews = [UIImageView]()
    
    let leftImageView = UIImageView()
    let centerImageView = UIImageView()
    let rightImageView = UIImageView()
    
    let centerImageCoverView = UIView()
    
    /// 最开始的位置
    var firstStartPoint = CGPoint.zero
    /// 根据最开始的位置
    var isPanLeftForFirstPoint: Bool!
    
    var lastPoint = CGPoint.zero
    /// 手势滑动的方向，时时追踪手势
    var isPanLeft = false
    
    /// 当前的索引
    var currentIndex = 0
    
    var images = [UIImage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        for i in 1...5 {
            let imgName = String(format: "tl_banner_%d", i)
            let img = UIImage(named: imgName)!
            images.append(img)
        }
        
        imageViews.append(leftImageView)
        imageViews.append(centerImageView)
        imageViews.append(rightImageView)
        
        leftImageView.image = images.last
        centerImageView.image = images[0]
        rightImageView.image = images[1]
        
        addSubview(leftImageView)
        addSubview(centerImageView)
        addSubview(rightImageView)
        
        
        leftImageView.snp.makeConstraints { make in
            make.right.equalTo(self.snp.left).offset(0)
            make.top.bottom.width.equalTo(centerImageView)
        }
        centerImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
            make.width.height.equalTo(self)
        }
        rightImageView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.right).offset(0)
            make.top.bottom.width.equalTo(centerImageView)
        }
        
        leftImageView.alpha = 0.5
        rightImageView.alpha = 0.5
        
        addGesture()
    }
    
    private func addGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        addGestureRecognizer(tap)
    }
    
    // MARK: 0.1
    @objc private func tapAction(_ pan: UITapGestureRecognizer) {
        debugPrint("点击了第%d页", currentIndex)
    }
    
    // MARK: 0.
    @objc private func panAction(_ pan: UIPanGestureRecognizer) {
        let state = pan.state
        let point = pan.location(in: self)
        
        if state == .began {
            firstStartPoint = point
            lastPoint = point
        } else if state == .changed {
            isPanLeft = lastPoint.x > point.x
            if isPanLeftForFirstPoint == nil {
                isPanLeftForFirstPoint = firstStartPoint.x > point.x
            }
            
            lastPoint = CGPoint(x: point.x, y: point.y)
            
            let panOffsetX = point.x - firstStartPoint.x
            handleScrollWithDirection(offsetX: panOffsetX)
        } else if state == .cancelled || state == .ended || state == .failed {
            let panOffsetX = point.x - firstStartPoint.x
            handleScrollWithDirection(isForEnd: true, offsetX: panOffsetX)
            
            // 重置
            firstStartPoint = .zero
            lastPoint = .zero
            
            isPanLeftForFirstPoint = false
            isPanLeft = false
        }
        
//        debugPrint("手势的方向是：%@", isPanLeft ? "👈" : "👉")
//        debugPrint("滚动距离为：%f", point.x - firstStartPoint.x)
    }
    
    deinit {
        debugPrint("\(self.classForCoder)---deinit")
    }
    
    // MARK: 1. 处理手势滑动时的view的位置
    private func handleScrollWithDirection(isForEnd: Bool = false, offsetX: CGFloat) {
        // 负值：手势向左，正值：手势向右; 偏移量达到宽度的一半-30时，即需要换页
        if isForEnd { // 手势结束
            if offsetX <= 0 { // 结束点在开始点的左侧，即此时控制的偏移view为rightView
                handleRightViewWhenPanEnd(offsetX: offsetX)
            } else if offsetX > 0 { // 结束点在开始点的左侧，即此时控制的偏移view为左边的leftView
                handleLeftViewWhenPanEnd(offsetX: offsetX)
            }
        } else { // 手势进行中
            if offsetX < 0 { // 负值
                if self.subviews.last != rightImageView {
                    // 调整显示优先级
                    bringSubviewToFront(rightImageView)
                    debugPrint("此时控制的是rightImageView")
                }
                
                // 左边的图片保持不动
                leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                
                rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(offsetX)
                }
                
            } else if offsetX == 0 {
                // 左边的图片保持不动
                leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                
                // 右边的图片保持不动
                rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
            } else { // 正值
                if self.subviews.last != leftImageView {
                    bringSubviewToFront(leftImageView)
                    debugPrint("此时控制的是leftImageView")
                }
                // 左边的图片保持不动
                leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(offsetX)
                }
                
                // 右边的图片保持不动
                rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
                
                debugPrint("此时控制的是leftImageView")
            }
        }
//        debugPrint("当前页码：%d", currentIndex)
    }
    
    
    // MARK: 2. 控制左边的view
    private func handleLeftViewWhenPanEnd(offsetX: CGFloat) {
        if offsetX < 0 {
            return
        }
        if offsetX >= width / 2.0 - 30 { // 需要分页
            currentIndex -= 1
            
            UIView.animate(withDuration: 0.1) {
                self.leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(self.width)
                }
            } completion: { finish in
                // 复原位置
                self.leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                self.rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
                // 数据源
                if self.currentIndex == -1 { // 最后一页
                    self.currentIndex = self.images.count - 1
                    self.leftImageView.image = self.images[self.currentIndex - 1]
                    self.centerImageView.image = self.images.last
                    self.rightImageView.image = self.images[0]
                } else if self.currentIndex == 0 {
                    self.leftImageView.image = self.images.last
                    self.centerImageView.image = self.images[0]
                    self.rightImageView.image = self.images[1]
                } else {
                    self.leftImageView.image = self.images[self.currentIndex - 1]
                    self.centerImageView.image = self.images[self.currentIndex]
                    self.rightImageView.image = self.images[self.currentIndex + 1]
                }
            }
            
        } else { // 不需要分页，则恢复到手势钱的姿态即可
            UIView.animate(withDuration: 0.1) {
                // 复原位置
                self.leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                self.rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
            } completion: { finish in
                
            }
        }
    }
    
    // MARK: 3. 控制右边view的
    private func handleRightViewWhenPanEnd(offsetX: CGFloat) {
        if offsetX > 0 {
            return
        }
        if -offsetX >= width / 2.0 - 30 { // 需要分页
            currentIndex += 1
            
            UIView.animate(withDuration: 0.1) {
                self.rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(-self.width)
                }
            } completion: { finish in
                // 复原位置
                self.leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                self.rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
                // 数据源
                if self.currentIndex == self.images.count - 1 { // 最后一页
                    self.leftImageView.image = self.images[self.currentIndex - 1]
                    self.centerImageView.image = self.images.last
                    self.rightImageView.image = self.images[0]
                } else if self.currentIndex == self.images.count {
                    self.currentIndex = 0
                    self.leftImageView.image = self.images.last
                    self.centerImageView.image = self.images[0]
                    self.rightImageView.image = self.images[1]
                } else {
                    self.leftImageView.image = self.images[self.currentIndex - 1]
                    self.centerImageView.image = self.images[self.currentIndex]
                    self.rightImageView.image = self.images[self.currentIndex + 1]
                }
            }
            
        } else { // 不需要分页，则恢复到手势钱的姿态即可
            UIView.animate(withDuration: 0.1) {
                // 复原位置
                self.leftImageView.snp.updateConstraints { make in
                    make.right.equalTo(self.snp.left).offset(0)
                }
                self.rightImageView.snp.updateConstraints { make in
                    make.left.equalTo(self.snp.right).offset(0)
                }
            } completion: { finish in
                
            }
        }
    }
    
    
    
}
