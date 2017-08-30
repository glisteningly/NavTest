//
//  MyObj.swift
//  NavTest
//
//  Created by AreX on 2017/8/30.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class MyObj: NSObject {
    @objc func reciveNotification(_ notification: NSNotification) {
        if let num = notification.object as? NSNumber {
            print("Name: \(notification.name), Value: \(num.intValue)")
        }

//        if let num = notification.object as? NSString {
//            print("Name: \(notification.name), Value: \(num)")
//        }
    }
}
