//
//  ObserveObject.swift
//  NavTest
//
//  Created by eeefan on 2017/9/4.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class ObserveObject: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        //加保护机制，避免object为nil时报错
        guard object != nil else {
            print("object is nil")
            return
        }

//        let str = (object as! NSObject).value(forKeyPath: keyPath!)
//        print(str!)

        if keyPath == "str" {
            if let old = change?[.oldKey] {
                print("旧的值: \(old)")
            }
            if let new = change?[.newKey] {
                print("新的值: \(new)")
            }
        }
    }

}
