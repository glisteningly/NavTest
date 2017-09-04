//
//  MyObject.swift
//  NavTest
//
//  Created by AreX on 2017/9/4.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

@objc
protocol MyObjectDelegate: NSObjectProtocol {
    //必须实现
    func returnAnswer(object: MyObject, answer: Float)
    //可选实现
    @objc optional func returnError(_ error: NSError?)
}

class MyObject: NSObject {
    var delegate: MyObjectDelegate?

    func divide(_ value: Float, by byValue: Float)
    {
        if byValue != 0 {
            delegate?.returnAnswer(object: self, answer: value / byValue)
        }

        if (delegate?.responds(to: #selector(MyObjectDelegate.returnError(_:))) != nil) {
            var error: NSError? = nil
            if byValue == 0 {
                error = NSError(domain: "DoM", code: 1, userInfo: [NSLocalizedDescriptionKey: "分母为零"])
            }
            delegate?.returnError!(error)
        }
    }
}

