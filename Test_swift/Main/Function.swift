//
//  Function.swift
//  Test_swift
//
//  Created by bavaria on 2021/3/31.
//

import UIKit



// MARK: 打印
func TSPrint(_ items: Any...) {
    #if DEBUG
    debugPrint(items)
    #else
    //        print(items)
    #endif
}
