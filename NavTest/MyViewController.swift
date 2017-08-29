//
//  MyViewController.swift
//  NavTest
//
//  Created by AreX on 2017/8/15.
//  Copyright © 2017年 AreX. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var str: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let str = str {
            print(str)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
