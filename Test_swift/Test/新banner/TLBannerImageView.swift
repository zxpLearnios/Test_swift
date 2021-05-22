//
//  TLBannerImageView.swift
//  Test_swift
//
//  Created by bavaria on 2021/5/11.
//

import UIKit

class TLBannerImageView: UIImageView {

    let leftCoverView = UIView()
    let rightCoverView = UIView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        leftCoverView.backgroundColor = .gray
        rightCoverView.backgroundColor = .red
        
        addSubview(leftCoverView)
        addSubview(rightCoverView)
        
        leftCoverView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(0)
        }
        rightCoverView.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(0)
            make.width.equalTo(0)
        }
        
    }
    
    
    func updteCoverViewWidth(width: Double, isForLeft: Bool = false) {
        let coverView = isForLeft ? leftCoverView : rightCoverView
        // 防止还没添加约束
        if (coverView.superview == nil) {
            return
        }
        
        coverView.snp.updateConstraints { make in
            make.width.equalTo(width)
        }
    }
    
    
    
}
