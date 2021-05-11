//
//  BGShareViewController.swift
//  BitGlobal
//
//  Created by Bava on 2019/12/9.
//  Copyright © 2019 Bava. All rights reserved.
//

import UIKit
//import Social

class BGShareViewController: UIActivityViewController {

    
    override init(activityItems: [Any], applicationActivities: [UIActivity]?) {
        super.init(activityItems: activityItems, applicationActivities: applicationActivities)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var activity = UIActivity()
        activity.activityType
        
        excludedActivityTypes = [] //[.postToFacebook, .postToTwitter, .message, .mail, .print, .copyToPasteboard, .assignToContact, .saveToCameraRoll, .postToVimeo, .postToFlickr, .postToVimeo, .postToTencentWeibo, .airDrop, .openInIBooks]
        
        // (UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError)
        completionWithItemsHandler = {[weak self] activityType, completed, returnedItems, error in
            guard let `self` = self else {
                return
            }
            self.dismiss(animated: true, completion: nil)
            if completed {
                
            } else {
                
            }
            
        }
    }
    


}
