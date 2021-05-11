//
//  TestSystemShareViewController.swift
//  Test_swift
//
//  Created by bavaria on 2021/4/1.
//

import UIKit

class TestSystemShareViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "测试系统分享"
        view.backgroundColor = .gray
        loadVideoFile()
    }
    
    private func loadVideoFile() {
        let videoFile = Bundle.main.path(forResource: "video-test-17.mp4", ofType: nil)!
        let url = URL.init(fileURLWithPath: videoFile)
        let data = NSData.init(contentsOf: url)
        
//        let shareVc = BGShareViewController(activityItems: [videoFile], applicationActivities: nil)
//        self.present(shareVc, animated: true, completion: nil)
        
        
        let shareVc = UIDocumentInteractionController(url: url)
        shareVc.delegate = self
        shareVc.presentPreview(animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let videoFile = Bundle.main.path(forResource: "video-test-17.mp4", ofType: nil)!
        let url = URL.init(fileURLWithPath: videoFile)
        let data = NSData.init(contentsOf: url)
        
        let shareVc = BGShareViewController(activityItems: [videoFile], applicationActivities: nil)
        self.present(shareVc, animated: true, completion: nil)
        
    }

    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
}


