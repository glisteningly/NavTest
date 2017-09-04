//
//  NotificationVC.swift
//  NavTest
//
//  Created by AreX on 2017/8/30.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    @objc dynamic var str = ""

    let obj = ObserveObject() //添加观察者

    let myObj = MyObj()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(myObj, selector: #selector(myObj.reciveNotification), name: NSNotification.Name(rawValue: "MYKEY"), object: nil)

        addObserver(obj, forKeyPath: "str", options: .new, context: nil)

        str = "hello"
    }

    @IBAction func onClicked(_ sender: Any) {
        struct Count_value {
            static var n = 0
        }

        Count_value.n += 1
        let num = NSNumber(value: Count_value.n)
//        let num = NSString(string: "ABCDE")

        let noti = Notification(name: Notification.Name(rawValue: "MYKEY"), object: num, userInfo: nil)
        NotificationCenter.default.post(noti)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
