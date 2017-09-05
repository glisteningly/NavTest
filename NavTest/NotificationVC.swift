//
//  NotificationVC.swift
//  NavTest
//
//  Created by AreX on 2017/8/30.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationVC: UIViewController, MyObjectDelegate, UITextFieldDelegate {
    @IBOutlet weak var strValueTxt: UITextField!

    //添加观察对象
    @objc dynamic var str = ""

    //添加观察者
    let obj = ObserveObject()

    //接受消息的对象
    let myObj = NoticeObj()

    //delegate对象
    let divObj = MyObject()

    //实现delegate的方法
    func returnAnswer(object: MyObject, answer: Float) {
        print("结果是: \(answer)")
    }
    func returnError(_ error: NSError?) {
        if let error = error {
            print("错误: \(error.localizedDescription)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        strValueTxt.delegate = self

        NotificationCenter.default.addObserver(myObj, selector: #selector(myObj.reciveNotification), name: NSNotification.Name(rawValue: "MYKEY"), object: nil)

        addObserver(obj, forKeyPath: "str", options: [.old, .new], context: nil)

        str = "hello"

        divObj.delegate = self
        divObj.divide(20, by: 4)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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

    @IBAction func changeBtn_clicked(_ sender: Any) {
        if !(strValueTxt.text?.isEmpty)! {
            str = strValueTxt.text!
        }
    }

    @IBAction func alertBtn_clicked(_ sender: Any) {
        sendNotification(5)
    }

    @IBAction func alert2Btn_clicked(_ sender: Any) {
        sendNotification(0)
    }

    @IBAction func clearBtn_clicked(_ sender: Any) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }


    func sendNotification(_ delay: Double) {
        let content = UNMutableNotificationContent()
        content.title = "推送测试"
        content.body = "Hello!"
        content.badge = 2
        content.sound = UNNotificationSound.default()

        let trigger = (delay > 0) ? UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false) : nil
        let request = UNNotificationRequest(identifier: "myid", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
