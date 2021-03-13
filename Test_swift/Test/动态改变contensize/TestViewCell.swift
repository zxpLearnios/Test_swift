//
//  TestViewCell.swift
//  Test_swift
//
//  Created by bavaria on 2021/1/18.
//

import UIKit

class TestViewCell: UITableViewCell {

    let lab = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    private func setup() {
        let bgview = UIView()
        bgview.backgroundColor = .gray
        
        lab.font = UIFont.systemFont(ofSize: 24)
        lab.numberOfLines = 0
        
//        addSubview(lab)
//        lab.snp.makeConstraints { (make) in
//            make.left.top.equalTo(20)
//            make.right.equalTo(-20)
//            make.bottom.equalTo(-10)
//        }
        
        // 2.
        let iconfontLab = UILabel()
        iconfontLab.text = kleftIconfont
        
        let iconfontImgView = UIImageView()
        iconfontImgView.image = UIImage.if_image(withUniCode: krightIconfont, fontSize: 10)
        
        
        addSubview(bgview)
        bgview.addSubview(iconfontLab)
        bgview.addSubview(iconfontImgView)
        
        bgview.snp.makeConstraints { (make) in
            make.edges.equalTo(10)
        }
        iconfontLab.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
        }
        iconfontImgView.snp.makeConstraints { (make) in
            make.left.equalTo(100)
            make.top.equalTo(iconfontLab.snp.bottom).offset(30)
            make.width.height.equalTo(100)
        }
        
    }
    
    func setTitle(_ str: String) {
        lab.text = str
        backgroundColor = (tag % 2 == 0) ? .gray : .red
    }

    
}
