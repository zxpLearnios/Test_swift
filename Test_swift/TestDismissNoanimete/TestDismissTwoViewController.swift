//
//  TestDismissTwoViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/2/27.
//

import UIKit

class TestDismissTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "被push出来的"
        view.backgroundColor = .blue
        
        modalPresentationStyle = .overFullScreen
        
    }
    

}
