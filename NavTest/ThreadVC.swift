//
//  ThreadVC.swift
//  NavTest
//
//  Created by eeefan on 2017/9/7.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class ThreadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        mainQueueTest()
//        globalQueueTest()
//        serialQueueTest()
        signalTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mainQueueTest() {
        let q = DispatchQueue.main
        q.async {
            for i in 1...10 {
                print(i)
            }
        }
        q.async {
            for i in 11...20 {
                print(i)
            }
        }
    }

    func globalQueueTest() {
        let q = DispatchQueue.global()
        q.sync {
            for i in 1...10 {
                print(i)
            }
        }
        q.async {
            for i in 11...20 {
                print(i)
            }
        }
        q.async {
            for i in 21...30 {
                print(i)
            }
        }
    }

    func serialQueueTest() {
        let q1 = DispatchQueue(label: "q1")
        let q2 = DispatchQueue(label: "q2")

        q1.async {
            for i in 1...10 {
                print(i)
            }
        }

        q1.async {
            for i in 11...20 {
                print(i)
            }
        }

        q2.async {
            for i in 21...30 {
                print(i)
            }
        }
    }

    func signalTest() {
        DispatchQueue.global().async {
            for i in 1...10 {
                //建立信号灯
                let semaphore = DispatchSemaphore(value: 0)
                if i == 3 {
                    DispatchQueue.main.async(execute: {
                        self.showAlert(semaphore: semaphore)
                    })
                } else {
                    //产生放行信号
                    semaphore.signal()
                }

                //等待放行信号
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)

                print(i)
                sleep(1)
            }
        }
    }

    func showAlert(semaphore: DispatchSemaphore) {
        let alert = UIAlertController(title: "警告", message: "按确定继续", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "确定", style: .default) { (action) in
            //产生放行信号
            semaphore.signal()
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)

    }
}
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


