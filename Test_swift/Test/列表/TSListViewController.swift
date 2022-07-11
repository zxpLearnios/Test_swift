//
//  TSListViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/4/9.
//  attributed 设置label的title也是可以适配约束的

import UIKit

class TSListViewController: UITableViewController {

    let redCoverBtn = UIButton()
    let redView = UIView()
    let cellId = "cell-id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSubview()
        
        
        // alert
        let alert = TestAlertView()
        
        let str = "狠角色给客户机看色关闭就开始崩闭就开始崩闭就开始崩111"
        let mainDic = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.orange]
        let subDic = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.blue]
        let attribute = NSMutableAttributedString(string: str, attributes: mainDic)
        attribute.addAttributes(subDic, range: NSRange(location: 10, length: 5))

        
        // 1.  测试弹框个各种情况
        alert.title = "看看和结构变化就"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            alert.title = "共商共建灰色轨迹就是表达个接口共商共建灰色轨迹就是表达个接口"
            alert.contentAttributeText = attribute
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
//            alert.title = "共商共建"
//            alert.contentAttributeText = attribute
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 9) { [weak self] in
//            alert.title = ""
//            alert.contentAttributeText = attribute
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 12) { [weak self] in
//            alert.title = "共商共建"
//            alert.contentAttributeText = nil
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 14) { [weak self] in
//            alert.title = nil
//            alert.contentAttributeText = nil
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 16) { [weak self] in
//            alert.title = "共商共建灰色轨迹就是表达个接口共商共建灰色轨迹就是表达个接口"
//            alert.contentAttributeText = attribute
//        }
        
        // 必须得这样才可以处理循环引用
//        alert.sureClosure = {[weak alert] str in
//            guard let alert = alert else { return }
//            alert.hide()
//        }
        
        
        // 2.1 测试此alertYY在最下面
//        alert.show()
        
        //
//        let kwindow = UIApplication.shared.windows.first!
//        redCoverBtn.backgroundColor = .blue.withAlphaComponent(0.4)
//        redCoverBtn.addTarget(self, action: #selector(tapCoverbtnAction), for: .touchUpInside)
//        redView.backgroundColor = .red
//
//        kwindow.addSubview(redCoverBtn)
//        kwindow.addSubview(redView)
//        redCoverBtn.snp.makeConstraints { make in
//            make.edges.equalTo(0)
//        }
//        redView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(130)
//        }
        
        // 2.2 测试此alertYY在最下面
        alert.show()
    }
    
    func setupSubview() {
        let labContainer = UIView()
        let lab = UILabel()
        
        let str = "了\n加班二级\n额不敢基本框架了加班"
        let mainDic = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.orange]
        let attribute = NSMutableAttributedString(string: str, attributes: mainDic)
        
        labContainer.backgroundColor = .red
        lab.textColor = .blue
//        lab.text = str
        lab.attributedText = attribute
        lab.textAlignment = .center
        lab.numberOfLines = 0
        
        view.addSubview(labContainer)
        labContainer.addSubview(lab)
        
        
        labContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
        }
        lab.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.top.bottom.equalTo(0)
        }
        
        
    }
    
    @objc private func tapCoverbtnAction() {
        redCoverBtn.removeFromSuperview()
        redView.removeFromSuperview()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        return cell!
    }
    
}

