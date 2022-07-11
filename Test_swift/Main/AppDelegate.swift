//
//  AppDelegate.swift
//  Test_swift
//
//  Created by bavaria on 2021/1/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        window = UIWindow.init(frame: UIScreen.main.bounds)
//        
//        window?.rootViewController = ViewController()
//        window?.backgroundColor = .white
//        window!.makeKeyAndVisible()
        
        test()
        
        return true
    }

  
    func test() {
        let a = -1 as NSNumber
        let a1 = 2 as NSNumber
//        debugPrint("dddd-dd: %@", a)
    }

}

