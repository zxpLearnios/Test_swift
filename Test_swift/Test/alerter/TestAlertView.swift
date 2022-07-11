//
//  TestLaertView.swift
//  Test_swift
//
//  Created by iMac on 2022/6/28.
//  title\content 有则膳食,无则不展示相应的栏位

import UIKit

class TestAlertView: UIView {
    
    private let coverBtn = UIButton()
    private let titleLab = UILabel()
    private let contentLab = UILabel()
    private let cancelBtn = UIButton()
    private let sureBtn = UIButton()
    private let hSep = UILabel()
    private let vSep = UILabel()
    
    private let cancelText = "取消"
    private let cancelTextColor = UIColor.colorWithHexString("4D4D4D")
    private let sureText = "确定"
    private let sureTextColor = UIColor.colorWithHexString("#FF53A0")
    
    var hideClosure: (() -> ())?
    var cancelClosure: (() -> Void)?
    var sureClosure: ((String) -> Void)?

    var isEnableTapCover = false
    var title: String? {
        didSet {
            updateUI()
        }
    }
    var contentAttributeText: NSAttributedString? {
        didSet {
            updateUI()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        coverBtn.backgroundColor = .black.withAlphaComponent(0.4)
        
        addSubview(titleLab)
        addSubview(contentLab)
        addSubview(cancelBtn)
        addSubview(sureBtn)
        addSubview(hSep)
        addSubview(vSep)
        
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        titleLab.text = ""
        
//        let str = ""
//        let mainDic = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.orange]
//        let subDic = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.blue]
//        let attribute = NSMutableAttributedString(string: str, attributes: mainDic)
//        attribute.addAttributes(subDic, range: NSRange(location: 10, length: 5))
        
        contentLab.attributedText = NSAttributedString(string: "")
        // 默认按钮的值
        setCancelText(cancelText, cancelTextColor: cancelTextColor, sureText: sureText, sureTextColor: sureTextColor)
        
        titleLab.textAlignment = .center
        titleLab.numberOfLines = 0
        titleLab.font = UIFont.boldSystemFont(ofSize: 25)
        
        contentLab.textAlignment = .center
        contentLab.numberOfLines = 0
        
        cancelBtn.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        cancelBtn.titleLabel!.textAlignment = .center
        sureBtn.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        sureBtn.titleLabel!.textAlignment = .center
        
        hSep.backgroundColor = UIColor.colorWithHexString("E6E6E6")
        vSep.backgroundColor = UIColor.colorWithHexString("#E6E6E6")
        
        coverBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        cancelBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        sureBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(25)
        }
        contentLab.snp.makeConstraints { make in
            make.left.right.equalTo(titleLab)
            make.top.equalTo(titleLab.snp.bottom).offset(15)
        }
        hSep.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.height.equalTo(1)
            make.top.equalTo(contentLab.snp.bottom).offset(25)
        }
        vSep.snp.makeConstraints { make in
            make.top.equalTo(hSep.snp.bottom)
            make.bottom.centerX.equalToSuperview()
            make.width.equalTo(1)
        }
        cancelBtn.snp.makeConstraints { make in
            make.top.equalTo(hSep.snp.bottom)
            make.left.bottom.equalTo(0)
            make.width.height.equalTo(sureBtn)
            make.height.equalTo(50)
        }
        sureBtn.snp.makeConstraints { make in
            make.left.equalTo(cancelBtn.snp.right)
            make.right.bottom.equalTo(0)
        }
        
    }
    
    
    @objc private func btnAction(_ btn: UIButton) {
        let text = btn.titleLabel!.text ?? ""
         
        if btn == cancelBtn {
            if let closure = cancelClosure {
                closure()
            }
            hide()
        } else if btn == sureBtn {
            if let closure = sureClosure {
                closure(text)
            }
            hide()
        } else {
            if isEnableTapCover {
                if let closure = hideClosure {
                    closure()
                }
                hide()
            } else {
                
            }
        }
    }
    
    private func updateUI() {
        let title = self.title ?? ""
        let contentAttributeStr = self.contentAttributeText ?? NSAttributedString(string: "")
        
        titleLab.text = title
        contentLab.attributedText = contentAttributeStr
        
        if title.count == 0 && contentAttributeStr.string.count == 0 {
            titleLab.snp.remakeConstraints { make in
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.height.equalTo(0)
            }
            contentLab.snp.remakeConstraints { make in
                make.left.right.top.height.equalTo(titleLab)
            }
            hSep.snp.remakeConstraints { make in
                make.left.right.top.equalTo(0)
                make.height.equalTo(1)
            }
        } else if title.count != 0 && contentAttributeStr.string.count == 0 { // 只有title,无content
            titleLab.snp.remakeConstraints { make in
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.equalTo(25)
            }
            contentLab.snp.remakeConstraints { make in
                make.left.right.equalTo(titleLab)
                make.top.equalTo(titleLab.snp.bottom).offset(15)
            }
            hSep.snp.remakeConstraints { make in
                make.left.right.equalTo(0)
                make.top.equalTo(contentLab.snp.bottom).offset(25)
                make.height.equalTo(1)
            }
        }  else if title.count == 0 && contentAttributeStr.string.count != 0 { // 无title, 只有content
            titleLab.snp.remakeConstraints { make in
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.height.equalTo(0)
            }
            contentLab.snp.remakeConstraints { make in
                make.left.right.equalTo(titleLab)
                make.top.equalTo(15)
            }
            hSep.snp.remakeConstraints { make in
                make.left.right.equalTo(0)
                make.top.equalTo(contentLab.snp.bottom).offset(25)
                make.height.equalTo(1)
            }
        } else { // 都有值
            titleLab.snp.remakeConstraints { make in
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.equalTo(25)
            }
            contentLab.snp.remakeConstraints { make in
                make.left.right.equalTo(titleLab)
                make.top.equalTo(titleLab.snp.bottom).offset(15)
            }
            hSep.snp.remakeConstraints { make in
                make.left.right.equalTo(0)
                make.height.equalTo(1)
                make.top.equalTo(contentLab.snp.bottom).offset(25)
            }
        }
    }
    
    
    
    func setCancelText(_ cText: String? = nil, cancelTextColor: UIColor? = nil, sureText: String? = nil, sureTextColor: UIColor? = nil) {
        if cText != nil {
            cancelBtn.setTitle(cText, for: .normal)
        } else { // 使用默认值
            cancelBtn.setTitle(self.cancelText, for: .normal)
        }
        if cancelTextColor != nil {
            cancelBtn.setTitleColor(cancelTextColor, for: .normal)
        } else { // 使用默认值
            cancelBtn.setTitleColor(self.cancelTextColor, for: .normal)
        }
        
        if sureText != nil {
            sureBtn.setTitle(sureText, for: .normal)
        } else { // 使用默认值
            sureBtn.setTitle(self.sureText, for: .normal)
        }
        if sureTextColor != nil {
            sureBtn.setTitleColor(sureTextColor, for: .normal)
        } else { // 使用默认值
            sureBtn.setTitleColor(self.sureTextColor, for: .normal)
        }
    }
    
    func show() {
        let kwindow = UIApplication.shared.windows.first!
        // UITransitionView有个子view:UITransitionView.  保证此alert永远在kwindow上面的所有 alert的最下面
        kwindow.insertSubview(coverBtn, at: 1)
        kwindow.insertSubview(self, at: 2)

        coverBtn.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        self.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-100)
        }
    }
    
    func hide() {
        coverBtn.removeFromSuperview()
        removeFromSuperview()
    }
    
    
    deinit {
        debugPrint("TestAlertView ---- deinit");
    }
}
